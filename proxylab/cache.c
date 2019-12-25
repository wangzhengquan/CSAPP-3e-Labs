#include "cache.h"

typedef struct tailq_entry_t
{
  void *buf;
  char key[200];
  size_t n;
  /*
   * This holds the pointers to the next and previous joint in the tail queue.
   */
  TAILQ_ENTRY(tailq_entry_t) joint;
} tailq_entry_t;


TAILQ_HEAD(tailq_header_t, tailq_entry_t);

static void evict(cache_t *cache);
static void _cache_put(cache_t *cache, char *key, void *buf, size_t n);
static void *_cache_get(cache_t *cache, char *key, ssize_t *n);

void cache_init(cache_t *cache)
{
  hashtable_init(&cache->my_hashtable);
  TAILQ_INIT(&cache->my_tailq_head);
  cache->amount = 0;
  cache->readcnt = 0;
  Sem_init(&cache->mutex, 0, 1);
  Sem_init(&cache->w, 0, 1);
}

void _cache_put(cache_t *cache, char *key, void *buf, size_t n)
{
  tailq_entry_t *item;

  cache_remove(cache, key);
  while (cache->amount + n > MAX_CACHE_SIZE)
  {
    evict(cache);
  }

  item = (tailq_entry_t *)Malloc(sizeof(tailq_entry_t));
  strcpy(item->key, key);
  item->buf = buf;
  item->n = n;
  TAILQ_INSERT_TAIL(&cache->my_tailq_head, item, joint);
  hashtable_put(&cache->my_hashtable, key, item);
  cache->amount += n;
  printf("put key=%s, amount=%ld\n", item->key, cache->amount);
}


void cache_put(cache_t *cache, char *key, void *buf, size_t n) {
  P(&cache->w);
  _cache_put(cache, key, buf, n);
  V(&cache->w);
}

void *cache_get(cache_t *cache, char *key, ssize_t *n) {
  P(&cache->mutex);
  cache->readcnt++;
  if(cache->readcnt == 1)
    P(&cache->w);
  V(&cache->mutex);

  void *buf = _cache_get(cache, key, n);

  P(&cache->mutex);
  cache->readcnt--;
  if(cache->readcnt == 0)
    V(&cache->w);
  V(&cache->mutex);
  return buf;
}

void *_cache_get(cache_t *cache, char *key, ssize_t *n)
{
  tailq_entry_t *item;
  tailq_entry_t *lastitem;

  if ((item = hashtable_get(&cache->my_hashtable, key)) == NULL)
    return NULL;

  lastitem = TAILQ_LAST(&cache->my_tailq_head, tailq_header_t);
  if (lastitem != item)
  {
    //最近访问的移动到队尾
    TAILQ_REMOVE(&cache->my_tailq_head, item, joint);
    TAILQ_INSERT_TAIL(&cache->my_tailq_head, item, joint);
  }
  *n = item->n;
  return item->buf;
}

void *cache_remove(cache_t *cache, char *key)
{
  tailq_entry_t *item = hashtable_remove(&cache->my_hashtable, key);
  void *buf;
  if (item != NULL)
  {
    TAILQ_REMOVE(&cache->my_tailq_head, item, joint);
    Free(item->buf);
    cache->amount -= item->n;
    buf = item->buf;
    printf("remove key=%s, amount=%ld\n", item->key, cache->amount);
    Free(item);
    return buf;
  }
  return NULL;
}

static void evict(cache_t *cache)
{
  tailq_entry_t *item = TAILQ_FIRST(&cache->my_tailq_head);
  TAILQ_REMOVE(&cache->my_tailq_head, item, joint);
  hashtable_remove(&cache->my_hashtable, item->key);
  Free(item->buf);
  cache->amount -= item->n;
  printf("evict key=%s, amount=%ld\n", item->key, cache->amount);
  Free(item);
}