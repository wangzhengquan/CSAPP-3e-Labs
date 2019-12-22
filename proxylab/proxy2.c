#include "csapp.h"
#include "sbuf.h"

/* Recommended max cache and object sizes */
#define MAX_CACHE_SIZE 1049000
#define MAX_OBJECT_SIZE 102400

#define NTHREADS  4
#define SBUFSIZE  16

void doit(int fd);
int parse_url(char *url, char *host, char *port, char *uri);
void *thread(void *vargp);


sbuf_t sbuf; /* Shared buffer of connected descriptors */

int main(int argc, char *argv[])
{
  int listenfd, connfd;
  char hostname[MAXLINE], port[MAXLINE];
  socklen_t clientlen;
  struct sockaddr_storage clientaddr;
  pthread_t tid;

  /* Check command line args */
  if (argc != 2)
  {
    fprintf(stderr, "usage: %s <port>\n", argv[0]);
    exit(1);
  }

  Signal(SIGPIPE, SIG_IGN);
  sbuf_init(&sbuf, SBUFSIZE); //line:conc:pre:initsbuf
  for (int i = 0; i < NTHREADS; i++)
    Pthread_create(&tid, NULL, thread, NULL);

  listenfd = Open_listenfd(argv[1]);
  while (1)
  {
    clientlen = sizeof(clientaddr);
    connfd = Accept(listenfd, (SA *)&clientaddr, &clientlen); //line:netp:tiny:accept
    Getnameinfo((SA *) &clientaddr, clientlen, hostname, MAXLINE,
                port, MAXLINE, 0);
    printf("Accepted connection from (%s, %s)\n", hostname, port);
    sbuf_insert(&sbuf, connfd);

  }
}

void *thread(void *vargp)
{
  Pthread_detach(pthread_self());
  while (1)
  {
    int connfd = sbuf_remove(&sbuf); 
    doit(connfd);
    Close(connfd);
  }
}

/*
 * doit - handle one HTTP request/response transaction
 */
void doit(int fd)
{
  char buf[MAXLINE],  method[20], uri[MAXLINE], version[20], host[MAXLINE], url[MAXLINE],  port[20];
  rio_t rio;
  ssize_t n;

// --------request line begin-----------
  Rio_readinitb(&rio, fd);
  if (!(n = Rio_readlineb(&rio, buf, MAXLINE)))
    return;
  strcpy(port, "80");
  //printf("%s", buf);
  sscanf(buf, "%s %s %s", method, url, version);

  parse_url(url, host, port, uri);
// --------request line end-----------

  //printf("url=%s\nhost=%s\nport=%s\nuri=%s\n", url, host, port, uri);
// --------request header begin-----------
  int serverfd;
  rio_t server_rio;
  int content_length = 0;

  serverfd = Open_clientfd(host, port);
  Rio_readinitb(&server_rio, serverfd);

  printf("-------request from client--------\n");
  /*sprintf(buf, "%s %s %s\r\n", method, uri, "HTTP/1.0");*/
  sprintf(buf, "%s %s %s\r\n", method, uri, version);
  Rio_writen(serverfd, buf, strlen(buf));
  Rio_writen(1, buf, strlen(buf));
  //strcat(header, buf);
  do
  {
    n = Rio_readlineb(&rio, buf, MAXLINE);
    if (strstr(buf, "Proxy-Connection"))
    {
      continue;
    }
    else if (strstr(buf, "Connection"))
    {
      strcpy(buf, "Connection: close\r\n");
      n = strlen(buf);
    }

    Rio_writen(serverfd, buf, n);
    Rio_writen(1, buf, n);
    

  //  strcat(header, buf);
    if (strstr(buf, "Content-Length"))
    {
      sscanf(buf, "Content-Length: %d", &content_length);
    }
  }
  while (strcmp(buf, "\r\n"));
// --------request header end-----------
  //Rio_writen(serverfd, header, strlen(header));
  //Rio_writen(1, header, strlen(header));

// --------request body begin-----------
  if (content_length > 0)
  {
    n = Rio_readnb(&rio, buf, content_length);
    Rio_writen(serverfd, buf, n);
    Rio_writen(1, buf, n);
  }
// --------request body end-----------


  printf("-------response to client--------\n");
// --------response header begin-----------
  do
  {
    n = Rio_readlineb(&server_rio, buf, MAXLINE);
    Rio_writen(fd, buf, n);
    printf("%s", buf);
  }
  while (strcmp(buf, "\r\n"));
// --------response header end-----------

// --------response body begin-----------
  while ((n = Rio_readnb(&server_rio, buf, MAXLINE)) != 0)
  {
    Rio_writen(fd, buf, n);
//    Rio_writen(1, buf, n);
  }
// --------response body end-----------
  Close(serverfd);
  printf("------close serverfd %d\n", serverfd);
  /*Close(fd);*/

}

int parse_url(char *url, char *host, char *port, char *uri)
{
  char *ptr;
  url = strstr(url, "://") + strlen("://");
  ptr = index(url, '/');
  strcpy(uri, ptr);
  *ptr = '\0';
  ptr = index(url, ':');
  if (ptr != 0)
  {
    strcpy(port, ptr + 1);
    *ptr = '\0';
  }
  else
  {
    strcpy(port, "80");
  }
  strcpy(host, url);
  return 1;
}

