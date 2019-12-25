#ifndef __HASHTABLE_H__
#define __HASHTABLE_H__

#include <sys/queue.h>
//#include "queue.h"

#define MAPSIZE 100

typedef struct hashtable_t
{
 struct tailq_header_t* array[MAPSIZE];

} hashtable_t;

void hashtable_init(hashtable_t *hashtable);
void *hashtable_get(hashtable_t *hashtable, char *key);
void* hashtable_put(hashtable_t *hashtable, char *key, void *value);
void *hashtable_remove(hashtable_t *hashtable, char *key);
void hashtable_removeall(hashtable_t *hashtable);


void hashtable_printall(hashtable_t *hashtable);
#endif
