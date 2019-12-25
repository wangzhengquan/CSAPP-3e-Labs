#include "csapp.h"
#include "hashtable.h"


typedef struct tailq_entry_t
{
  void *value;
  char key[200];
  /*
   * This holds the pointers to the next and previous joint in
   * the tail queue.
   */
  TAILQ_ENTRY(tailq_entry_t) joint;
} tailq_entry_t;


typedef  TAILQ_HEAD(tailq_header_t, tailq_entry_t) tailq_header_t;

static size_t hashcode(char *key);

void hashtable_init(hashtable_t *hashtable )
{
  memset(hashtable, 0, sizeof(hashtable_t));
}


void *hashtable_get(hashtable_t *hashtable, char *key)
{
  size_t code = hashcode(key);
  tailq_entry_t *item;
  tailq_header_t *my_tailq_head = hashtable->array[code] ;
  if ( my_tailq_head == NULL)
  {
    return NULL;
  }
  else
  {

    TAILQ_FOREACH(item, my_tailq_head, joint)
    {
      if (strcmp(key, item->key) == 0)
        return item->value;
    }
  }
  return NULL;

}

void* hashtable_put(hashtable_t *hashtable, char *key, void *value)
{
  size_t code = hashcode(key);
  void *oldvalue;
  tailq_entry_t *item;
  tailq_header_t *my_tailq_head = hashtable->array[code] ;
  if ( my_tailq_head == NULL)
  {
    my_tailq_head  = (tailq_header_t*) Malloc(sizeof(tailq_header_t ));
    TAILQ_INIT(my_tailq_head);
    hashtable->array[code] = my_tailq_head;
    goto putnew;
  }

  TAILQ_FOREACH(item, my_tailq_head, joint)
  {
    if (strcmp(key, item->key) == 0)
    {
      oldvalue = item -> value;
      strcpy(item->key, key);
      item -> value = value;
      return oldvalue;
    }
  }
putnew:
  item = (tailq_entry_t *)Malloc(sizeof(tailq_entry_t));
  strcpy(item->key, key);
  item -> value = value;
  TAILQ_INSERT_TAIL(my_tailq_head, item, joint);
  return NULL;
}

void *hashtable_remove(hashtable_t *hashtable, char *key)
{
  size_t code = hashcode(key);
  tailq_entry_t *item;
  void *oldvalue;
  tailq_header_t *my_tailq_head = hashtable->array[code] ;
  if ( my_tailq_head == NULL)
  {
    return NULL;
  }
  else
  {
    for (item = TAILQ_FIRST(my_tailq_head); item != NULL; item = TAILQ_NEXT(item, joint))
    {
      if (strcmp(key, item->key) == 0)
      {
        oldvalue = item->value;
        /* Remove the item from the tail queue. */
        TAILQ_REMOVE(my_tailq_head, item, joint);

        /* Free the item as we don't need it anymore. */
        Free(item);

        return oldvalue;
      }
    }
  }
  return NULL;

}

void hashtable_removeall(hashtable_t *hashtable)
{
  tailq_entry_t *item;
  for (int i = 0; i < MAPSIZE; i++)
  {
    tailq_header_t *my_tailq_head = hashtable->array[i] ;

    if (my_tailq_head == NULL )
      continue;

    while ((item = TAILQ_FIRST(my_tailq_head)) )
    {
      TAILQ_REMOVE(my_tailq_head, item, joint);
      Free(item);
    }
    Free(my_tailq_head);
    hashtable->array[i] = NULL;
  }
}

/**
 * for debug
 */
void hashtable_printall(hashtable_t *hashtable)
{
  tailq_entry_t *item;
  for (int i = 0; i < MAPSIZE; i++)
  {
    tailq_header_t *my_tailq_head = hashtable->array[i] ;

    if (my_tailq_head == NULL )
      continue;

    printf("code=%d\n", i);
    TAILQ_FOREACH(item, my_tailq_head, joint)
    {
      printf("%s:%s\n", item->key, (char *)item->value);
    }
    printf("\n");
  }
}

static size_t hashcode(char *key)
{
  size_t code = 0;
  char c = 0;
  while ((c = *key) != 0)
  {
    code += c;
    key++;
  }
  return code % MAPSIZE;
  /*printf("hashfun = %ld\n", code);*/
}
