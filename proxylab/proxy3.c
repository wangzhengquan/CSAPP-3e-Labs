#include "csapp.h"
#include "sbuf.h"

/* Recommended max cache and object sizes */
#define MAX_CACHE_SIZE 1049000
#define MAX_OBJECT_SIZE 102400

#define NTHREADS 6 
#define SBUFSIZE 32
#define LOG(LEVEL, MSG, ...) \
  if(LEVEL)  { \
    printf(MSG, ##__VA_ARGS__);\
  } \

#define IOLOG(LEVEL, BUF, N) \
  if(LEVEL)  { \
    Rio_writen(1, BUF, N); \
  } \

const char *http_methods[] =
{
  "OPTIONS",
  "GET",
  "HEAD",
  "POST",
  "PUT",
  "DELETE",
  "TRACE",
  0
//  "CONNECT"
};

typedef struct request_t
{
  char host[100];
  char port[20];
  char method[20];
  char version[20];
  char uri[200];
  char url[200];
} request_t;

typedef struct header_t
{
  size_t content_length;
  int keep_alive;

} header_t;

void doit(int fd);
int parse_url(char *url, char *host, char *port, char *uri);
int parse_request(char *requestline, request_t *request);
//int parse_header (rio_t *rrio, int wfd, size_t *content_length, int *keep_alive);
int parse_header (rio_t *rrio, header_t *header, char *headbuf, size_t *buflen);
void *thread(void *vargp);
int support(char *method);

sbuf_t sbuf; /* Shared buffer of connected descriptors */
int verbose = 1;
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
//Programe crashed when the browser was closed prematurely
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
//   Close(connfd);
  }
}

/*
 * doit - handle one HTTP request/response transaction
 */
void doit(int clientfd)
{
  char buf[MAXLINE], headbuf[MAXBUF];
  request_t request;
  rio_t client_rio;
  ssize_t n;
  header_t header;
  size_t headlen;

  int serverfd;
  rio_t server_rio;
  char *body;

  Rio_readinitb(&client_rio, clientfd);

// --------request line begin-----------
//request_line:
  if ((n = Rio_readlineb(&client_rio, buf, MAXLINE)) <= 0)
  {
    goto end;
  }
  parse_request(buf, &request);
  //printf("url=%s\nhost=%s\nport=%s\nuri=%s\n", url, host, port, uri);
  if ((serverfd = Open_clientfd(request.host, request.port)) < 0)
  {
    Close(clientfd);
    return;
  }
  Rio_readinitb(&server_rio, serverfd);

//transfer:
  LOG(verbose, "-------request from client--------\n");
  sprintf(buf, "%s %s %s\r\n", request.method, request.uri, request.version);
  n = strlen(buf);
  if (Rio_writen(serverfd, buf, n) < n)
    goto end;

  IOLOG(verbose, buf, n);
// --------request line end-----------

// --------request header begin-----------
  if (parse_header(&client_rio, &header, headbuf, &headlen))
  {
    if (Rio_writen(serverfd, headbuf, headlen) < headlen)
      goto end;
    IOLOG(verbose, headbuf, headlen);
  }
  else
    goto end;
// --------request header end-----------


// --------request body begin-----------
  if (header.content_length > 0)
  {
    body = (char *)Malloc(header.content_length);
    if ( (n = Rio_readnb(&client_rio, body, header.content_length)) != header.content_length)
      goto end;
    if (Rio_writen(serverfd, body, n) < n)
      goto end;
    IOLOG(verbose, body, n);
    Free(body);
  }
// --------request body end-----------


  LOG(verbose, "-------response to client--------\n");
// --------response header begin-----------
  if (parse_header(&server_rio, &header, headbuf, &headlen))
  {
    if (Rio_writen(clientfd, headbuf, headlen) < headlen)
      goto end;
    IOLOG(verbose, headbuf, headlen);
  }
  else
    goto end;
// --------response header end-----------
//
// --------response body begin-----------
  if (header.content_length > 0)
  {
    body = (char *)Malloc(header.content_length);
    n = Rio_readnb(&server_rio, body, header.content_length);
    if (Rio_writen(clientfd, body, n) != n )
      goto end;
    Free(body);
  }
  else
  {
    while ((n = Rio_readnb(&server_rio, buf, MAXLINE)) > 0)
    {
      if (Rio_writen(clientfd, buf, n) != n)
        goto end;
      // Rio_writen(1, buf, n);
    }
  }
  // --------response body end-----------

end:
  Close(serverfd);
  Close(clientfd);
  LOG(verbose, "------close serverfd %d\n", serverfd);
  LOG(verbose, "------close clientfd %d\n", clientfd);

}


int parse_header (rio_t *rrio, header_t *header, char *headbuf, size_t *buflen)
{
  char buf[MAXLINE], connection[100];
  int n;
  int ntotal = 0;
  *headbuf = 0;
  header->content_length = 0;
  do
  {
    if ((n = Rio_readlineb(rrio, buf, MAXLINE)) <= 0 )
      return 0;
    if (strstr(buf, "Proxy-Connection"))
    {
      continue;
    }

    /*if (Rio_writen(wfd, buf, n) != n)*/
    /*return 0;*/
    /*if (verbose)*/
    /*Rio_writen(1, buf, n);*/


    strncat(headbuf, buf, n);
    ntotal += n;

    if (strstr(buf, "Content-Length"))
    {
      sscanf(buf, "Content-Length: %ld", &header->content_length);
    }
    else if (strstr(buf, "Connection"))
    {
      sscanf(buf, "Connection: %s", connection);
      if (strcmp(connection, "keep-alive") == 0)
        header->keep_alive = 1;
      else
        header->keep_alive = 0;
    }
  }
  while (strcmp(buf, "\r\n"));
  *buflen = ntotal;
  return 1;

}

int parse_request(char *requestline, request_t *request)
{
  strcpy(request->port, "80");
  sscanf(requestline, "%s %s %s", request->method, request->url, request->version);
  if (!support(request->method)) {
    fprintf(stderr, "Not implement this method:%s \n%s\n", request->method, requestline);
    return 0;
  }
  parse_url(request->url, request->host, request->port, request->uri);
  return 1;
}

int support(char *method) {
  int i = 0;
  while(http_methods[i++] != NULL)
    if(strcmp(http_methods[i], method) == 0)
      return 1;
  return 0;
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
