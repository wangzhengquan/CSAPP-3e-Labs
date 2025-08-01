/*
 * tsh - A tiny shell program with job control
 *
 * <Put your name and login ID here>
 */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <errno.h>
#include <time.h>


/* Misc manifest constants */
#define MAXLINE    1024   /* max line size */
#define MAXARGS     1280   /* max args on a command line */
#define MAXJOBS      16   /* max jobs at any point in time */
#define MAXJID    1<<16   /* max job ID */

/* Job states */
#define UNDEF 0 /* undefined */
#define FG 1    /* running in foreground */
#define BG 2    /* running in background */
#define ST 3    /* stopped */

/*
 * Jobs states: FG (foreground), BG (background), ST (stopped)
 * Job state transitions and enabling actions:
 *     FG -> ST  : ctrl-z
 *     ST -> FG  : fg command
 *     ST -> BG  : bg command
 *     BG -> FG  : fg command
 * At most 1 job can be in the FG state.
 */

/* Global variables */
extern char **environ;      /* defined in libc */
char prompt[] = "tsh> ";    /* command line prompt (DO NOT CHANGE) */
int verbose = 0;            /* if true, print additional output */
int nextjid = 1;            /* next job ID to allocate */
char sbuf[MAXLINE];         /* for composing sprintf messages */

struct job_t                /* The job struct */
{
  pid_t pid;              /* job PID */
  int jid;                /* job ID [1, 2, ...] */
  int state;              /* UNDEF, BG, FG, or ST */
  char cmdline[MAXLINE];  /* command line */
};
struct job_t jobs[MAXJOBS]; /* The job list */
/* End global variables */

struct command_t
{
  char **argv;   /* argument list for execve() */           
  int pipe; /* pipe flag */
  int pfds[2];
};

/* Function prototypes */

/* Here are the functions that you will implement */
void eval(char *cmdline);
int builtin_cmd(char **argv);
void do_bgfg(char **argv);
void waitfg();

void sigchld_handler(int sig);
void sigtstp_handler(int sig);
void sigint_handler(int sig);

/* Here are helper routines that we've provided for you */
int parseline(const char *cmdline, char **argv);
void sigquit_handler(int sig);

void clearjob(struct job_t *job);
void initjobs(struct job_t *jobs);
int maxjid(struct job_t *jobs);
int addjob(struct job_t *jobs, pid_t pid, int state, char *cmdline);
int deletejob(struct job_t *jobs, pid_t pid);
pid_t fgpid(struct job_t *jobs);
struct job_t *getjobpid(struct job_t *jobs, pid_t pid);
struct job_t *getjobjid(struct job_t *jobs, int jid);
int pid2jid(pid_t pid);
void listjobs(struct job_t *jobs);
void listjob(struct job_t *job);

void usage(void);
void unix_error(char *msg);
void app_error(char *msg);
typedef void handler_t(int);
handler_t *Signal(int signum, handler_t *handler);

void exec(char *argv[]);
void error_exit(int code, char *msg);
pid_t exec_cmds(struct command_t (*cmds)[], int c, int bg, char *cmdline);

/*
 * main - The shell's main routine
 */
int main(int argc, char **argv)
{
  char c;
  char cmdline[MAXLINE];
  int emit_prompt = 1; /* emit prompt (default) */
  if (signal(SIGPIPE, SIG_IGN) == SIG_ERR) error_exit(errno, "signal");
  /* Redirect stderr to stdout (so that driver will get all output
   * on the pipe connected to stdout) */
  dup2(1, 2);

  /* Parse the command line */
  while ((c = getopt(argc, argv, "hvp")) != EOF)
  {
    switch (c)
    {
    case 'h':             /* print help message */
      usage();
      break;
    case 'v':             /* emit additional diagnostic info */
      verbose = 1;
      break;
    case 'p':             /* don't print a prompt */
      emit_prompt = 0;  /* handy for automatic testing */
      break;
    default:
      usage();
    }
  }

  /* Install the signal handlers */

  /* These are the ones you will need to implement */
  Signal(SIGINT,  sigint_handler);   /* ctrl-c */
  Signal(SIGTSTP, sigtstp_handler);  /* ctrl-z */
  Signal(SIGCHLD, sigchld_handler);  /* Terminated or stopped child */

  /* This one provides a clean way to kill the shell */
  Signal(SIGQUIT, sigquit_handler); /* Ctrl + \ */

  /* Initialize the job list */
  initjobs(jobs);

  /* Execute the shell's read/eval loop */
  while (1)
  {

    /* Read command line */
    if (emit_prompt)
    {
      printf("%s", prompt);
      fflush(stdout);
    }
    if ((fgets(cmdline, MAXLINE, stdin) == NULL) && ferror(stdin))
      app_error("fgets error");
    if (feof(stdin))   /* End of file (ctrl-d) */
    {
      fflush(stdout);
      exit(0);
    }

    /* Evaluate the command line */
    eval(cmdline);
    fflush(stdout);
    fflush(stdout);
  }

  exit(0); /* control never reaches here */
}

/*
 * eval - Evaluate the command line that the user has just typed in
 *
 * If the user has requested a built-in command (quit, jobs, bg or fg)
 * then execute it immediately. Otherwise, fork a child process and
 * run the job in the context of the child. If the job is running in
 * the foreground, wait for it to terminate and then return.  Note:
 * each child process must have a unique process group ID so that our
 * background children don't receive SIGINT (SIGTSTP) from the kernel
 * when we type ctrl-c (ctrl-z) at the keyboard.
*/
void eval(char *cmdline)
{
  char *argv[MAXARGS]; /* Argument list execve() */
  char buf[MAXLINE];   /* Holds modified command line */
  struct command_t cmds[128];
  int bg;              /* Should the job run in bg or fg? */
  
  strcpy(buf, cmdline);
  bg = parseline(buf, argv);

  if (argv[0] == NULL)
    return;   /* Ignore empty lines */

  if (!builtin_cmd(argv))
  {
    
    int s = 0, c = 0;
    for (int i = 0; argv[i] != NULL; i++)
    {
      if(strcmp(argv[i], "|") == 0)
      {
        argv[i] = NULL;
        cmds[c++] = (struct command_t){.argv = &argv[s], .pipe = 1};
        s = i + 1;
      }
    }
    cmds[c++] = (struct command_t){.argv = &argv[s], .pipe = 0};

    pid_t pid = exec_cmds(&cmds, c, bg, cmdline);
    
    /* Parent waits for foreground job to terminate */
    if (!bg)
      waitfg();
    else
      listjob(getjobpid(jobs, pid));
  }
  return;
}

pid_t exec_cmds(struct command_t (*cmds)[], int c, int bg, char *cmdline){
  pid_t pid = 0;           /* Process id */
  sigset_t mask_all, mask_one, pre;

  sigfillset(&mask_all);
  sigemptyset(&mask_one);
  sigaddset(&mask_one, SIGCHLD);
  sigprocmask(SIG_BLOCK, &mask_one, &pre);
  int i;
  for ( i = 0; i< c; i++) {
    if (verbose)
      printf("%ld executing command %d: %s\n", time(NULL), i, (*cmds)[i].argv[0]);
    if ((*cmds)[i].pipe)
    {
      if (pipe((*cmds)[i].pfds) == -1) error_exit(errno, "pipe");
    }
    if ((pid = fork()) == 0)     /* Child runs user job */
    {
      setpgid(0, 0);
      sigprocmask(SIG_SETMASK, &pre, NULL);

      if (verbose)
        printf("%ld child %d created\n", time(NULL), getpid());
      if ((*cmds)[i].pipe) {
        if (close((*cmds)[i].pfds[0]) == -1) error_exit(errno, "close pfd[0]");
        if ((*cmds)[i].pfds[1] != STDOUT_FILENO) {
          if (dup2((*cmds)[i].pfds[1], STDOUT_FILENO) == -1) error_exit(errno, "dup2 pfd[1]");
          if (close((*cmds)[i].pfds[1]) == -1) error_exit(errno, "close pfd[1]");
        }
      }

      if (i > 0 && (*cmds)[i-1].pipe){
        if (close((*cmds)[i-1].pfds[1]) == -1) error_exit(errno, "close pfd[1]");
        if ((*cmds)[i-1].pfds[0] != STDIN_FILENO) {
          if (dup2((*cmds)[i-1].pfds[0], STDIN_FILENO) == -1) error_exit(errno, "dup2 (*cmds)[i-1].pfds[0]"); 
          if (close((*cmds)[i-1].pfds[0]) == -1) error_exit(errno, "close (*cmds)[i-1].pfds[0]");
        }
      }
      
      exec((*cmds)[i].argv);
    } 
    if (i > 0 && (*cmds)[i-1].pipe){
      if (close((*cmds)[i-1].pfds[0]) == -1) error_exit(errno, "close 5");
      if (close((*cmds)[i-1].pfds[1]) == -1) error_exit(errno, "close 6");
    }
    addjob(jobs, pid, bg ? BG : FG, cmdline);
  }
  if ((*cmds)[i].pipe){
      if (close((*cmds)[i].pfds[0]) == -1) error_exit(errno, "close 5");
      if (close((*cmds)[i].pfds[1]) == -1) error_exit(errno, "close 6");
  }
  //sigprocmask(SIG_BLOCK, &mask_all, NULL);
  sigprocmask(SIG_SETMASK, &pre, NULL);
  return pid;
}

void exec(char *argv[]) {
  if (strncmp(argv[0], "./", 2) != 0 || strncmp(argv[0], "/", 1) != 0){
    char *path = getenv("PATH");
    if (path == NULL)
    {
      printf("PATH environment variable not set.\n");
      exit(1);
    }
    char *p = strtok(path, ":");
    while (p != NULL)
    {
      char fullpath[MAXLINE];
      snprintf(fullpath, sizeof(fullpath), "%s/%s", p, argv[0]);
      if (access(fullpath, X_OK) == 0){
        argv[0] = fullpath;
        break;
      }
        
      p = strtok(NULL, ":");
    }
  }
  if (execve(argv[0], argv, environ) < 0)
  {
    printf("%s: Command not found.\n", argv[0]);
    exit(0);
  }
}


/*
 * parseline - Parse the command line and build the argv array.
 *
 * Characters enclosed in single quotes are treated as a single
 * argument.  Return true if the user has requested a BG job, false if
 * the user has requested a FG job.
 */
int parseline(const char *cmdline, char **argv)
{
  static char array[MAXLINE]; /* holds local copy of command line */
  char *buf = array;          /* ptr that traverses command line */
  char *delim;                /* points to first space delimiter */
  int argc;                   /* number of args */
  int bg;                     /* background job? */

  strcpy(buf, cmdline);
  buf[strlen(buf) - 1] = ' '; /* replace trailing '\n' with space */
  while (*buf && (*buf == ' ')) /* ignore leading spaces */
    buf++;

  /* Build the argv list */
  argc = 0;
  if (*buf == '\'')
  {
    buf++;
    delim = strchr(buf, '\'');
  }
  else
  {
    delim = strchr(buf, ' ');
  }

  while (delim)
  {
    argv[argc++] = buf;
    *delim = '\0';
    buf = delim + 1;
    while (*buf && (*buf == ' ')) /* ignore spaces */
      buf++;

    if (*buf == '\'')
    {
      buf++;
      delim = strchr(buf, '\'');
    }
    else
    {
      delim = strchr(buf, ' ');
    }
  }
  argv[argc] = NULL;

  if (argc == 0)  /* ignore blank line */
    return 1;

  /* should the job run in the background? */
  if ((bg = (*argv[argc - 1] == '&')) != 0)
  {
    argv[--argc] = NULL;
  }
  return bg;
}

/*
 * builtin_cmd - If the user has typed a built-in command then execute
 *    it immediately.
 */
int builtin_cmd(char **argv)
{
  if (!strcmp(argv[0], "quit")) /* quit command */
    exit(0);
  if (!strcmp(argv[0], "&"))    /* Ignore singleton & */
    return 1;
  if (!strcmp(argv[0], "jobs"))
  {
    listjobs(jobs);
    return 1;
  }
  if (!strcmp(argv[0], "fg") || !strcmp(argv[0], "bg"))
  {
    do_bgfg(argv);
    return 1;
  }
  return 0;                     /* Not a builtin command */
}

/*
 * do_bgfg - Execute the builtin bg and fg commands
 */
void do_bgfg(char **argv)
{
  struct job_t *job;
  char *name = argv[0];
  char *num = argv[1];
  if (num == NULL)
  {
    printf("%s command requires PID or %%jobid argumenti\n", name);
    return;
  }

  if (*num == '%')
  {
    num = num + 1;
    if (strspn(num, "0123456789") != strlen(num))
    {
      printf("%s: argument must be a PID or %%jobid\n", name);
      return;
    }
    job = getjobjid(jobs, atoi(num));
    if (job == NULL)
    {
      printf("%%%s: No such job\n", num);
      return;
    }
  }
  else
  {
    if (strspn(num, "0123456789") != strlen(num))
    {
      printf("%s: argument must be a PID or %%jobid\n", name);
      return;
    }
    job = getjobpid(jobs, (pid_t)atoi(num));
    if (job == NULL)
    {
      printf("(%s): No such process\n", num);
      return;
    }
  }

  if (!strcmp(argv[0], "fg"))
  {
    kill(job->pid, SIGCONT);
    job->state = FG;
    waitfg();
  }
  else if (!strcmp(argv[0], "bg"))
  {
    kill(job->pid, SIGCONT);
    job->state = BG;
    listjob(job);
  }

  return;
}

/*
 * waitfg - Block until process pid is no longer the foreground process
 */
void waitfg()
{
  /*
   * 以trace06.txt为例，
   *  (1) ./myspin 4  # 子进程前台执行，主进程进入pause
   *  (2) CTRL_C发送INT信号给主进程.
   *  (3) 主进程中断pause状态,进入INT处理函数(sigint_handler).该函数把INT信号转发给前台(fg)子进程,完成后返回上次中断的位置, 继续执行下一条指令,发现while循环条件依然成立又进入pause。
   *  (4) 前台子进程被INT信号终止结束生命发送CHLD信号给主进程.
   *  (5) 主进程再次中断pause状态，进入CHLD处理函数(sigchld_handler),回收僵尸进程，删除对应的job,处理完成后返回上次中断的位置，继续执行下一条指令，发现while循环条件不再成立，跳出whlile循环。。
   */


  /*
   *  假若(3)的中断位置在while条件执行后，pause执行前，那么中断处理函数返回后会一直pause，sigsuspend可以避免这种情况。
   */

  /*
   *while (fgpid(jobs)) {
   *   printf("%ld pausing...\n", time(NULL));
   *   pause();
   *   printf("%ld interrupted return\n", time(NULL));
   *}
   */


  sigset_t mask, prev;
  sigemptyset(&mask);
  sigaddset(&mask, SIGCHLD);
  sigprocmask(SIG_BLOCK, &mask, &prev);
  while (fgpid(jobs))
  {
    if (verbose) printf("%ld pausing...\n", time(NULL));
    sigsuspend(&prev);
    if (verbose) printf("%ld interrupt return\n", time(NULL));
  }
  sigprocmask(SIG_SETMASK, &prev, NULL);
}

/*****************
 * Signal handlers
 *****************/

/*
 * sigchld_handler - The kernel sends a SIGCHLD to the shell whenever
 *     a child job terminates (becomes a zombie), or stops because it
 *     received a SIGSTOP or SIGTSTP signal. The handler reaps all
 *     available zombie children, but doesn't wait for any other
 *     currently running children to terminate.
 */
void sigchld_handler(int sig)
{
  if (verbose)
    printf("%ld interrupt by SIGCHLD(%d)\n", time(NULL), sig);

  int olderrno = errno;
  pid_t pid;
  int status;
  while ( (pid = waitpid(-1, &status, WNOHANG | WUNTRACED | WCONTINUED)) > 0)
  {
    if (WIFEXITED(status))
    {
      /*if (verbose)*/
      /*printf("Job [%d] (%d)  normally exit by signal %d\t%s\n", pid2jid(pid), pid, WEXITSTATUS(status), getjobpid(jobs, pid)->cmdline);*/
      deletejob(jobs, pid);
    }
    else if (WIFSIGNALED(status))
    {
      printf("Job [%d] (%d) terminated by signal %d\n", pid2jid(pid), pid, WTERMSIG(status));
      deletejob(jobs, pid);
    }
    else if (WIFSTOPPED(status))
    {
      printf("Job [%d] (%d) stopted by signal %d\n", pid2jid(pid), pid, WSTOPSIG(status));
      getjobpid(jobs, pid)->state = ST;
    }
    else if (WIFCONTINUED(status))
    {
    }
  }

  if (pid == -1 && errno != ECHILD)
  {
    unix_error("sigchld_handler error");
  }
  errno = olderrno;
}

/*
 * sigint_handler - The kernel sends a SIGINT to the shell whenver the
 *    user types ctrl-c at the keyboard.  Catch it and send it along
 *    to the foreground job.
 */
void sigint_handler(int sig)
{
  if (verbose)
    printf("%ld interrupt by SIGINT(%d)\n", time(NULL), sig);

  int olderrno = errno;
  pid_t pid = fgpid(jobs);
  if (pid == 0){
    return;
  }
  if (kill(pid, SIGINT) == -1)
  {
    unix_error("sigint_handler");
  }
  errno = olderrno;
}

/*
 * sigtstp_handler - The kernel sends a SIGTSTP to the shell whenever
 *     the user types ctrl-z at the keyboard. Catch it and suspend the
 *     foreground job by sending it a SIGTSTP.
 */
void sigtstp_handler(int sig)
{
  if (verbose)
  {
    printf("%ld interrupt by SIGSTP(%d)\n", time(NULL), sig);
  }
  int olderrno = errno;
  pid_t pid = fgpid(jobs);
  if (kill(pid, SIGTSTP) == -1)
    unix_error("sigtstp_handler");
  errno = olderrno;
}

/*********************
 * End signal handlers
 *********************/

/***********************************************
 * Helper routines that manipulate the job list
 **********************************************/

/* clearjob - Clear the entries in a job struct */
void clearjob(struct job_t *job)
{
  job->pid = 0;
  job->jid = 0;
  job->state = UNDEF;
  job->cmdline[0] = '\0';
}

/* initjobs - Initialize the job list */
void initjobs(struct job_t *jobs)
{
  int i;

  for (i = 0; i < MAXJOBS; i++)
    clearjob(&jobs[i]);
}

/* maxjid - Returns largest allocated job ID */
int maxjid(struct job_t *jobs)
{
  int i, max = 0;

  for (i = 0; i < MAXJOBS; i++)
    if (jobs[i].jid > max)
      max = jobs[i].jid;
  return max;
}

/* addjob - Add a job to the job list */
int addjob(struct job_t *jobs, pid_t pid, int state, char *cmdline)
{
  int i;

  if (pid < 1)
    return 0;

  for (i = 0; i < MAXJOBS; i++)
  {
    if (jobs[i].pid == 0)
    {
      jobs[i].pid = pid;
      jobs[i].state = state;
      jobs[i].jid = nextjid++;
      if (nextjid > MAXJOBS)
        nextjid = 1;
      strcpy(jobs[i].cmdline, cmdline);
      if (verbose)
      {
        printf("%ld Added job [%d] %d %s\n", time(NULL), jobs[i].jid, jobs[i].pid, jobs[i].cmdline);
        //printf("Added job [%d] %d %s\n", jobs[i].jid, jobs[i].pid, jobs[i].cmdline);
      }
      return 1;
    }
  }
  printf("Tried to create too many jobs\n");
  return 0;
}

/* deletejob - Delete a job whose PID=pid from the job list */
int deletejob(struct job_t *jobs, pid_t pid)
{
  int i;

  if (pid < 1)
    return 0;

  for (i = 0; i < MAXJOBS; i++)
  {
    if (jobs[i].pid == pid)
    {
      if (verbose)
      {
        printf("%ld deleted job [%d] %d %s\n", time(NULL), jobs[i].jid, jobs[i].pid, jobs[i].cmdline);
        // printf("deleted job [%d] %d %s\n", jobs[i].jid, jobs[i].pid, jobs[i].cmdline);
      }
      clearjob(&jobs[i]);
      nextjid = maxjid(jobs) + 1;
      return 1;
    }
  }
  return 0;
}

/* fgpid - Return PID of current foreground job, 0 if no such job */
pid_t fgpid(struct job_t *jobs)
{
  int i;

  for (i = 0; i < MAXJOBS; i++)
    if (jobs[i].state == FG)
      return jobs[i].pid;
  return 0;
}

/* getjobpid  - Find a job (by PID) on the job list */
struct job_t *getjobpid(struct job_t *jobs, pid_t pid)
{
  int i;

  if (pid < 1)
    return NULL;
  for (i = 0; i < MAXJOBS; i++)
    if (jobs[i].pid == pid)
      return &jobs[i];
  return NULL;
}

/* getjobjid  - Find a job (by JID) on the job list */
struct job_t *getjobjid(struct job_t *jobs, int jid)
{
  int i;

  if (jid < 1)
    return NULL;
  for (i = 0; i < MAXJOBS; i++)
    if (jobs[i].jid == jid)
      return &jobs[i];
  return NULL;
}

/* pid2jid - Map process ID to job ID */
int pid2jid(pid_t pid)
{
  int i;

  if (pid < 1)
    return 0;
  for (i = 0; i < MAXJOBS; i++)
    if (jobs[i].pid == pid)
    {
      return jobs[i].jid;
    }
  return 0;
}

/* listjobs - Print the job list */
void listjobs(struct job_t *jobs)
{
  int i;

  for (i = 0; i < MAXJOBS; i++)
  {
    if (jobs[i].pid != 0)
    {
      printf("[%d] (%d) ", jobs[i].jid, jobs[i].pid);
      switch (jobs[i].state)
      {
      case BG:
        printf("Running ");
        break;
      case FG:
        printf("Foreground ");
        break;
      case ST:
        printf("Stopped ");
        break;
      default:
        printf("listjobs: Internal error: job[%d].state=%d ",
               i, jobs[i].state);
      }
      printf("%s", jobs[i].cmdline);
    }
  }
}

void listjob(struct job_t *job)
{
  if (job->pid != 0)
  {
    printf("[%d] (%d) %s", job->jid, job->pid, job->cmdline);
  }
}
/******************************
 * end job list helper routines
 ******************************/


/***********************
 * Other helper routines
 ***********************/

/*
 * usage - print a help message
 */
void usage(void)
{
  printf("Usage: shell [-hvp]\n");
  printf("   -h   print this message\n");
  printf("   -v   print additional diagnostic information\n");
  printf("   -p   do not emit a command prompt\n");
  exit(1);
}

/*
 * unix_error - unix-style error routine
 */
void unix_error(char *msg)
{
  fprintf(stdout, "%s: %s\n", msg, strerror(errno));
  exit(1);
}

/*
 * app_error - application-style error routine
 */
void app_error(char *msg)
{
  fprintf(stdout, "%s\n", msg);
  exit(1);
}

/*
 * Signal - wrapper for the sigaction function
 */
handler_t *Signal(int signum, handler_t *handler)
{
  struct sigaction action, old_action;

  action.sa_handler = handler;
  sigemptyset(&action.sa_mask); /* block sigs of type being handled */
  action.sa_flags = SA_RESTART; /* restart syscalls if possible */

  if (sigaction(signum, &action, &old_action) < 0)
    unix_error("Signal error");
  return (old_action.sa_handler);
}

/*
 * sigquit_handler - The driver program can gracefully terminate the
 *    child shell by sending it a SIGQUIT signal.
 */
void sigquit_handler(int sig)
{
  printf("Terminating after receipt of SIGQUIT signal\n");
  exit(1);
}


void error_exit(int code, char *msg) /* Posix-style error */
{
  fprintf(stderr, "%s: %s\n", msg, strerror(code));
  exit(1);
}
