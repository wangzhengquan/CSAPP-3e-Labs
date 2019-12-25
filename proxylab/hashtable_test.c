#include "csapp.h"
#include "hashtable.h"
int main()
{
  hashtable_t hashtable;

  hashtable_init(&hashtable);
  hashtable_put(&hashtable, "hello1", "hello1_value");
  hashtable_put(&hashtable, "hello2", "hello2_value");
  hashtable_put(&hashtable, "hello3", "hello3_value");
  hashtable_printall(&hashtable);

  printf("\ntest get\n");
  printf("get hello2 = %s\n", (char *)hashtable_get(&hashtable, "hello2"));

  printf("\ntest remove\n");
  hashtable_remove(&hashtable, "hello2");
  printf("get hello2 = %s\n", (char *)hashtable_get(&hashtable, "hello2"));
  
  printf("\ntest remove all\n");
  hashtable_removeall(&hashtable);
  hashtable_printall(&hashtable);
}
