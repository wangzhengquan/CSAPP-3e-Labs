/**
 * 多线程+缓存
 */
#include "csapp.h"
#include "sbuf.h"
#include "cache.h"

#define NTHREADS 8
#define SBUFSIZE 64
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

typedef struct response_t
{
  char version[20];
  int state_code;
  char state_msg[100];
} response_t;

typedef struct header_t
{
  size_t content_length;
  int keep_alive;

} header_t;

void doit(int fd);
int parse_url(char *url, char *host, char *port, char *uri);
int parse_request(char *requestline, request_t *request);
int parse_response(char *response_line, response_t *response);
ssize_t  parse_header (rio_t *rrio, header_t *header, char *buf, size_t n);
void *thread(void *vargp);
int support(char *method);
void clienterror(int fd, char *cause, char *errnum, char *shortmsg, char *longmsg);

sbuf_t sbuf; /* Shared buffer of connected descriptors */
cache_t cache;
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
  cache_init(&cache);
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
void doit(int clientfd)
{
  char buf[MAXBUF];
  request_t request;
  rio_t client_rio;
  ssize_t n;
  header_t header;
  size_t content_length;

  int serverfd = -1;
  rio_t server_rio;
  char *body;
  response_t response;
  char *cache_buf;
  char *cache_buf_ptr;

  Rio_readinitb(&client_rio, clientfd);

// --------request line begin-----------
//request_line:
  if ((n = Rio_readlineb(&client_rio, buf, MAXLINE)) <= 0)
  {
    return;
  }
  parse_request(buf, &request);
//  printf("url=%s\nhost=%s\nport=%s\nuri=%s\n", request.url, request.host, request.port, request.uri);
//缓存是否命中
//printf("=========难道时堵塞在这里了？\n");
  cache_buf = cache_get(&cache, request.url, &n);
  if (cache_buf != NULL)
  {
    LOG(verbose, "========hit=%s\n", request.url);
    Rio_writen(clientfd, cache_buf, n);
  //  IOLOG(verbose, cache_buf, n);
    return;
  }

  if ((serverfd = Open_clientfd(request.host, request.port)) < 0)
  {
    clienterror(clientfd, request.url, "404", "Not found", "Couldn't access this site!");
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
  if ((n = parse_header(&client_rio, &header, buf, MAXBUF)) > 0)
  {
    if (Rio_writen(serverfd, buf, n) < n)
      goto end;
    IOLOG(verbose, buf, n);
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
  if ((n = Rio_readlineb(&server_rio, buf, MAXLINE)) <= 0)
  {
    goto end;
  }

  content_length = 0;
  cache_buf = (char *)Malloc(MAX_OBJECT_SIZE );
  cache_buf_ptr = cache_buf;

  parse_response(buf, &response);
  if (Rio_writen(clientfd, buf, n) < n)
  {
    Free(cache_buf);
    goto end;
  }

  IOLOG(verbose, buf, n);
  content_length += n;
  if (content_length <= MAX_OBJECT_SIZE)
  {
    memcpy(cache_buf_ptr, buf, n);
    cache_buf_ptr += n;
  }
// --------response header begin-----------
  if ((n = parse_header(&server_rio, &header, buf, MAXBUF)) > 0)
  {
    if (Rio_writen(clientfd, buf, n) < n)
      goto end;
    IOLOG(verbose, buf, n);
    content_length += n;
    if (content_length <= MAX_OBJECT_SIZE)
    {
      memcpy(cache_buf_ptr, buf, n);
      cache_buf_ptr += n;
    }
  }
  else
  {
    Free(cache_buf);
    goto end;
  }
// --------response header end-----------

// --------response body begin-----------

  if (response.state_code == 304)
  {
    //浏览器本地缓存有效
    LOG(verbose, "-----browser cache valid-----\n");
    Free(cache_buf);
    goto end;
  }

  /*content_length = header.content_length;*/
  /*if (content_length > 0 && content <= MAX_OBJECT_SIZE)*/
  /*{*/
  /*cache_buf = (char *)Malloc(content_length);*/
  /*n = Rio_readnb(&server_rio, cache_buf, content_length);*/
  /*if (n != content_length || Rio_writen(clientfd, cache_buf, n) != n )*/
  /*{*/
  /*Free(cache_buf);*/
  /*goto end;*/
  /*}*/
  /*cache_put(&cache, header.url, cache_buf, content_length);*/
  /*}*/
  while ((n = Rio_readnb(&server_rio, buf, MAXBUF)) > 0)
  {
    if (Rio_writen(clientfd, buf, n) != n)
    {
      Free(cache_buf);
      goto end;
    }
    content_length += n;
    if (content_length <= MAX_OBJECT_SIZE)
    {
      memcpy(cache_buf_ptr, buf, n);
      cache_buf_ptr += n;
    }
    // Rio_writen(1, buf, n);
  }
  if (content_length <= MAX_OBJECT_SIZE)
  {
    cache_buf = Realloc(cache_buf, content_length);
    cache_put(&cache, request.url, cache_buf, content_length);
    LOG(verbose,"===========putto cache %s,size %ld\n", request.url, content_length);
  }
  else {
    LOG(verbose,"===========abandon cache %s,too large size %ld\n", request.url, content_length);
    Free(cache_buf);
  }
  // --------response body end-----------

end:
  Close(serverfd);
  LOG(verbose, "------close serverfd %d\n", serverfd);

}

ssize_t parse_header(rio_t *rrio, header_t *header, char *buf, size_t n)
{
  char line[MAXLINE], connection[100];
  ssize_t nline, ntotal = 0;
  *buf = 0;
  header->content_length = 0;
  do
  {
    if ((nline = Rio_readlineb(rrio, line, MAXLINE)) <= 0 )
      return nline;
    if (strstr(line, "Proxy-Connection"))
    {
      continue;
    }

    strncat(buf, line, nline);
    ntotal += nline;
    if (n < ntotal)
    {
      fprintf(stderr, "parse_header out of bundary errror, buffer not big enough");
      return -1;
    }

    if (strstr(line, "Content-Length"))
    {
      sscanf(line, "Content-Length: %ld", &header->content_length);
    }
    else if (strstr(line, "Connection"))
    {
      sscanf(line, "Connection: %s", connection);
      if (strcmp(connection, "keep-alive") == 0)
        header->keep_alive = 1;
      else
        header->keep_alive = 0;
    }
  }
  while (strcmp(line, "\r\n"));
  return ntotal;
}

int parse_request(char *requestline, request_t *request)
{
  strcpy(request->port, "80");
  sscanf(requestline, "%s %s %s", request->method, request->url, request->version);
  if (!support(request->method))
  {
    fprintf(stderr, "Not implement this method:%s \n%s\n", request->method, requestline);
    return 0;
  }
  parse_url(request->url, request->host, request->port, request->uri);
  return 1;
}

int parse_response(char *response_line, response_t *response)
{
  sscanf(response_line, "%s %d %s",
         response->version, &response->state_code, response->state_msg);
  return 1;
}


int support(char *method)
{
  int i = 0;
  while (http_methods[i] != NULL)
  {
    if (strcmp(http_methods[i], method) == 0)
      return 1;
    i++;
  }
  return 0;
}

int parse_url(char *url, char *host, char *port, char *uri)
{
  char *startptr, *ptr;
  char tmpurl[200];

  strcpy(tmpurl, url);
  //协议"http://"后的位置
  startptr = ptr = strstr(tmpurl, "://") + strlen("://");
  //host后的位置
  ptr = index(startptr, '/');
  strcpy(uri, ptr);
  *ptr = '\0';
  //port的位置
  ptr = index(startptr, ':');
  if (ptr != 0)
  {
    strcpy(port, ptr + 1);
    *ptr = '\0';
  }
  else
  {
    strcpy(port, "80");
  }
  strcpy(host, startptr);
  return 1;
}

void clienterror(int fd, char *cause, char *errnum, char *shortmsg, char *longmsg)
{
  char buf[MAXLINE];

  /* Print the HTTP response headers */
  sprintf(buf, "HTTP/1.1 %s %s\r\n", errnum, shortmsg);
  Rio_writen(fd, buf, strlen(buf));
  sprintf(buf, "Content-type: text/html\r\n\r\n");
  Rio_writen(fd, buf, strlen(buf));

  /* Print the HTTP response body */
  sprintf(buf, "<html><title>Error</title>");
  Rio_writen(fd, buf, strlen(buf));
  sprintf(buf, "<body bgcolor=""ffffff"">\r\n");
  Rio_writen(fd, buf, strlen(buf));
  sprintf(buf, "%s: %s\r\n", errnum, shortmsg);
  Rio_writen(fd, buf, strlen(buf));
  sprintf(buf, "<p>%s: %s\r\n", longmsg, cause);
  Rio_writen(fd, buf, strlen(buf));
  sprintf(buf, "<hr><em>The Tiny Web server</em>\r\n");
  Rio_writen(fd, buf, strlen(buf));
}
