#ifndef __CACHE_H__
#define __CACHE_H__

#include "csapp.h"
#include "hashtable.h"
#include <sys/queue.h>
/* Recommended max cache and object sizes */
#define MAX_CACHE_SIZE 1049000
#define MAX_OBJECT_SIZE 102400

typedef struct cache_t
{
  TAILQ_HEAD(, tailq_cache_entry_t) my_cache_tailq_head;
  hashtable_t my_hashtable;
  size_t amount;
  size_t readcnt;
  sem_t w;

  pthread_mutex_t mutex;
  pthread_cond_t cond;
} cache_t;

void cache_init(cache_t *cache);
void cache_put(cache_t *cache, char *key, void *buf, size_t n);
void *cache_get(cache_t *cache, char *key, ssize_t *n);
void *cache_remove(cache_t *cache, char *key);
void cache_clear(cache_t *cache);

#endif
