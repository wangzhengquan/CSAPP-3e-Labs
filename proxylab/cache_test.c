#include "csapp.h"
#include "cache.h"

cache_t cache;

void insert(int start, int n);

int main()
{
  ssize_t n;
  cache_init(&cache);

  insert(0, 10);

  printf("\ntest get\n");
  printf("get hello2=%s\n", (char *) cache_get(&cache, "hello2", &n));

  printf("\ntest remove\n");
  cache_remove(&cache, "hello2");
  printf("get hello2=%s\n", (char *) cache_get(&cache, "hello2", &n));


  printf("\ntest put same key\n");
  insert(8, 1);

  printf("\ntest clear\n");
  insert(2, 1);
  cache_clear(&cache);
  printf("get hello2=%s\n", (char *) cache_get(&cache, "hello2", &n));

  printf("\ntest evict\n");
  insert(11, 10);

}


void insert(int start, int n)
{
  char *buf;
  char key[100];
  for (int i = 0; i < n; i++)
  {
    buf = (char *)Malloc( MAX_OBJECT_SIZE);
    sprintf(key, "hello%d", start);
    sprintf(buf, "hello world %d", start);
    cache_put(&cache, key, buf,  MAX_OBJECT_SIZE);
    start++;
  }
}
