
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <getopt.h>
#include <string.h>
#include <inttypes.h>
#include <time.h>
#include "cachelab.h"

typedef struct
{
  unsigned long last_update;
  int valid ;
  unsigned long tag;
  unsigned int B;
  uint8_t *block;
} Line;

typedef struct
{
  unsigned int E;
  Line *lines;
} Set;

typedef struct
{
  unsigned long hits;
  unsigned long misses;
  unsigned long evictions;
  unsigned int S;
  unsigned int s;
  unsigned int E;
  unsigned int b;
  unsigned int B;
  Set *sets;
} Cache;

typedef struct
{
  char op;
  unsigned long addr;
  unsigned int size;
  int r_hit;
  int w_hit;
  int eviction;
} Record;

typedef struct
{
  unsigned long limit;
  unsigned long size;
  Record *arr;
} Array;


void creat_cache(int s, int E, int b);
void print_help(FILE *out, char *name);
void read_trace(char *pathname);
Record parse(char buff[]) ;
void init_record_list();
void add_record(Record r) ;
void access_cache();
void print_detial() ;
void free_cache();

Cache *cache ;
Array record_list = {};

int main(int argc, char* argv[])
{

  int verbose = 0;
  int s, E, b;
  /*char tracefile[100] = {'\0'};*/
  char *tracefile;
  int opt;
  while ((opt = getopt(argc, argv, "hvs:E:b:t:")) != -1)
  {
    switch (opt)
    {
    case 'h':
      print_help(stdout, argv[0]);
      exit(EXIT_SUCCESS);
    case 'v':
      verbose = 1;
      break;
    case 's':
      s = atoi(optarg);
      break;
    case 'E':
      E = atoi(optarg);
      break;
    case 'b':
      b = atoi(optarg);
      break;
    case 't':
      /*strncpy(tracefile, optarg, 100);*/
      tracefile = optarg;
      break;
    default:
      /*fprintf(stderr, "erro %s\n", optarg);*/
      print_help(stderr, argv[0]);
      exit(EXIT_FAILURE);
    }
  }


  if (s == 0 || E == 0 || b == 0 || tracefile == NULL)
  {
    print_help(stderr, argv[0]);
    exit(EXIT_FAILURE);
  }

  /*printf("v=%d; s=%d; E=%d; b=%d; t=%s\n", verbose, s, E, b, tracefile);*/


  creat_cache(s, E, b);
  init_record_list();
  read_trace(tracefile);
  access_cache();
  if (verbose)
  {
    print_detial();
  }
  printSummary(cache->hits, cache->misses, cache->evictions);

  free_cache();
  free((void *)record_list.arr);
  exit(EXIT_SUCCESS);
//    printSummary(0, 0, 0);
}

void init_record_list()
{
  record_list.limit = 100;
  record_list.arr = (Record *)calloc(record_list.limit, sizeof(Record));
  record_list.size = 0;
}

void add_record(Record r)
{
  if (record_list.size >= record_list.limit)
  {
    record_list.limit = record_list.limit * 2;
    record_list.arr = (Record *)realloc(record_list.arr, record_list.limit * (sizeof(Record)) );
  }
  record_list.arr[record_list.size++] = r;
}

void creat_cache(int s, int E, int b)
{
  cache = (Cache *)malloc(sizeof(Cache));
  int B = 1 << b;
  int S = 1 << s;

  cache->S = S;
  cache->s = s;
  cache->E = E;
  cache->b = b;
  cache->B = B;

  cache->sets = (Set *) malloc(sizeof(Set) * S);
  for (int S_i = 0; S_i < S; S_i++)
  {
    cache->sets[S_i].lines = (Line *) calloc(E, sizeof(Line));
    cache->sets[S_i].E = E;
    for (int L_i = 0; L_i < E; L_i++)
    {
      cache->sets[S_i].lines[L_i].block = (uint8_t *) malloc(B);
      /*cache->sets[S_i].lines[L_i].tag = -1;*/
      cache->sets[S_i].lines[L_i].B = B;
    }
  }

}

void free_cache()
{

  for (int S_i = 0; S_i < cache->S; S_i++)
  {
    for (int L_i = 0; L_i < cache->E; L_i++)
    {
      free((void *)cache->sets[S_i].lines[L_i].block);
    }
    free((void *)cache->sets[S_i].lines);
  }
  free((void *)cache->sets);
  free((void *)cache);

}

void access_cache()
{

  char op;
  long addr;
  int size;
  int offset, index;
  long tag;
  int hit;
  int lines_i;
  Line* lines;
  Line *line;
  Line *update_line;
  Record *r;
  for (int i = 0; i < record_list.size; i++)
  {
    r = &record_list.arr[i];
    op = r->op;
    addr = r->addr;
    size = r->size;

    offset = addr & ((1 << cache->b) - 1);
    index = addr >> cache->b & ((1 << cache->s) - 1);
    tag = addr >> (cache->b + cache->s);
    lines = cache->sets[index].lines;
    hit = 0;
    for (lines_i = 0; lines_i < cache->E; lines_i++)
    {
      line = &lines[lines_i];
      /*printf("ctag = %lx. %lx\n", tag, line->tag);*/

      if (line->tag == tag && line->valid && (offset + size) <= cache->B )
      {
        hit = 1;
        break;
      }
    }
    if (hit)
    {
      line->last_update = i;
      if (op == 'M')
      {
        cache->hits += 2;
        r -> r_hit = 1;
        r -> w_hit = 1;
      }
      else if (op == 'S')
      {
        r -> w_hit = 1;
        cache->hits++;
      }
      else
      {
        r -> r_hit = 1;
        cache->hits++;
      }
    }
    else
    {
      cache->misses++;
      update_line = &lines[0];

      if (cache -> E > 1 && update_line->valid)
      {
        for (lines_i = 1; lines_i < cache->E; lines_i++)
        {
          line = &lines[lines_i];
          if (!line->valid)
          {
            update_line = line;
            break;
          }
          else if (line->last_update < update_line->last_update)
          {
            update_line = line;
          }
        }
      }

      if (update_line->valid)
      {
        r-> eviction = 1;
        cache->evictions++;
      }
      /*printf("update line %lx, %d, %lx\n", update_line->tag, index, tag);*/
      update_line->valid = 1;
      update_line->tag = tag;
      update_line->last_update = i;

      if (op == 'M' && (offset + size) <= cache->B)
      {
        cache->hits++;
        r->w_hit = 1;
      }
    }

    /*printf("%c, %ld, %d\n", record_list.arr[i].op, record_list.arr[i].addr, record_list.arr[i].size);*/

  }

}

void read_trace(char *pathname)
{
  FILE *file;
  Record r;
  file = fopen(pathname, "r");
  char buff[100];

  if (file == NULL)
  {
    perror("Error opening file.");

  }
  else
  {
    while (fgets(buff, 100, file) != NULL)
    {

      r = parse(buff);
      if (r.op != 'I')
        add_record(r);
    }

    fclose(file);
  }
}

Record parse(char buff[])
{
  /*printf("%s\n", buff);*/
  char c;
  char op;
  char addr_str[20], size_str[20];
  long addr;
  int size;
  int addr_i = 0, size_i = 0;
  int field = 0;
  while ((c = *buff++) != '\0')
  {
    if (c == ' ')
      continue;

    if (c == ',')
    {
      field++;
      continue;
    }

    if (field == 2)
    {
      size_str[size_i++] = c;
    }
    else if (field == 1)
    {
      addr_str[addr_i++] = c;
    }
    else if (field == 0)
    {
      op = c;
      field++;
    }
  }

  size_str[size_i] = '\0';
  addr_str[addr_i] = '\0';
  /*printf("%c, %s, %s", op, addr_str, size_str);*/
  addr = strtol(addr_str, NULL, 16);
  size = atoi(size_str);
  Record r = {op, addr, size, 0, 0, 0};
  return r;
}

void print_help(FILE *out, char *name)
{
  fprintf(out, "Usage: %s [-hv] -s <num> -E <num> -b <num> -t <file>\n", name);
  fprintf(out, "Examples:\n");
  fprintf(out, "  linux>  %s -s 4 -E 1 -b 4 -t traces/yi.trace\n", name);
  fprintf(out, "  linux>  %s -v -s 8 -E 2 -b 4 -t traces/yi.trace\n", name);
}

void print_detial()
{
  Record *r;
  for (int i = 0; i < record_list.size; i++)
  {
    r = &record_list.arr[i];
    printf("%c %lx,%d", r->op, r->addr, r->size );
    if (r -> op == 'M')
    {
      printf("%s%s%s \n", r->r_hit ? " hit" : " miss",
             r->eviction ? " eviction" : "",
             r->w_hit ? " hit" : " miss");
    }
    else if (r -> op == 'L')
    {
      printf("%s%s \n", r->r_hit ? " hit" : " miss",
             r->eviction ? " eviction" : "" );
    }
    else if (r -> op == 'S')
    {
      printf("%s%s \n", r->w_hit ? " hit" : " miss",
             r->eviction ? " eviction" : "" );
    }
  }

}
