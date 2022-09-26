/*
 * mm-explicit.c - The fastest, least memory-efficient malloc package.
 *
 * In this naive approach, a block is allocated by simply incrementing
 * the brk pointer.  A block is pure payload. There are no headers or
 * footers.  Blocks are never coalesced or reused. Realloc is
 * implemented directly using mm_malloc and mm_free.
 *
 * NOTE TO STUDENTS: Replace this header comment with your own header
 * comment that gives a high level description of your solution.
 */
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <unistd.h>
#include <string.h>

#include "mm.h"
#include "memlib.h"

/*********************************************************
 * NOTE TO STUDENTS: Before you do anything else, please
 * provide your team information in the following struct.
 ********************************************************/
team_t team =
{
  /* Team name */
  "ateam",
  /* First member's full name */
  "zheng Wang",
  /* First member's email address */
  "wangzhengquan85@126.com",
  /* Second member's full name (leave blank if none) */
  "",
  /* Second member's email address (leave blank if none) */
  ""
};

/* $begin mallocmacros */

/* rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(size) (((size_t)(size) + (ALIGNMENT-1)) & ~(ALIGNMENT - 1))

/* Returns true if p is ALIGNMENT-byte aligned */
#define IS_ALIGNED(p)  ((((size_t)(p)) & (ALIGNMENT - 1)) == 0)


/* Basic constants and macros */
#define WSIZE (sizeof(size_t)) /* Word and header/footer size (bytes) */

#define PTR_SIZE (sizeof(void *))

// #define MIN_BLOCK_SIZE (ALIGN( (WSIZE << 1) + WSIZE + (PTR_SIZE << 1) ))

#define MIN_BLOCK_SIZE (ALIGN( (WSIZE << 1) + (PTR_SIZE << 1) ))

#define CHUNKSIZE  (1<<12)  /* Extend heap by this amount (bytes) */  //line:vm:mm:endconst

#define MAX(x, y) ((x) > (y)? (x) : (y))

/* Pack a size and allocated bit into a word and returns a value that can be stored in a header or footer */
#define PACK(size, alloc)  ((size) | (alloc))

/* Read and write a word at address p */
#define GET(p)       (*(size_t *)(p))
#define PUT(p, val)  (*(size_t *)(p) = (val))

#define GET_PTR(p)       (*(char **)(p))
#define PUT_PTR(p, val)  (*(char **)(p) = (val))

/* Read the size and allocated fields from a header or footer at address p */
#define GET_SIZE(p)  (GET(p) & ~(ALIGNMENT - 1))
#define GET_ALLOC(p) (GET(p) & 0x1)

/* Given block ptr bp, compute address of its header and footer */
#define HDRP(bp)       ((char *)(bp) - WSIZE)
#define FTRP(bp)       ((char *)(bp) + GET_SIZE(HDRP(bp)) - 2 * WSIZE)


/* Given block ptr bp, compute address of next and previous blocks */
#define NEXT_BLKP(bp)  ((char *)(bp) + GET_SIZE(((char *)(bp) - WSIZE)))
#define PREV_BLKP(bp)  ((char *)(bp) - GET_SIZE(((char *)(bp) - 2 * WSIZE)))

/*Given block ptr bp, return address where sotre the next and pre free-block's address in linked list*/
#define SUCCRP(bp)       ((char **)(bp) + 1)
#define PREDRP(bp)       ((char **)(bp))

/*Given block ptr bp, return the address of the next free block int the linked list  */
#define GET_SUCCR(bp) (*SUCCRP(bp))
#define GET_PREDR(bp) (*PREDRP(bp))

#define SET_SUCCR(bp, val)  ( PUT_PTR( SUCCRP(bp), (val) ) )
#define SET_PREDR(bp, val)  ( PUT_PTR( PREDRP(bp), (val) ) )
 

/* $end malloc macros */

/* Global variables */
static char *heap_listp = 0;  /* Pointer to first block */

/* Function prototypes for internal helper routines */
static void *extend_heap(size_t words);
static void *place(void *bp, size_t size);
static void *find_fit(size_t size);
static void *coalesce(void *bp);
static void rm_fblock(void *bp);
static void insert_fblock (void *bp);

static int is_allocated(void *ptr);

/*
 * mm_init - Initialize the memory manager
 */
int mm_init(void)
{
  /* 
   * Prologue represent the start of whole block , it also represet the start and the end of free block linklist, 
   * Epilogue represent the end of whole block.
   */
  /* Create the initial empty heap */
  /*Prologue + Epilogue, Prologue include a header, a footer, a predecessor and a successor. Epilogue contains only a header*/
  int prologue_size = 2 * WSIZE + 2 * PTR_SIZE;
  int epilogue_size = WSIZE;
  int initsize = ALIGN(prologue_size + epilogue_size);

  if ((heap_listp = mem_sbrk(initsize)) == (void *) - 1)
    return -1;
//printf("heap_listp=%p, initsize=%d\n", heap_listp, initsize);
  // Epilogue header 
  PUT(heap_listp + initsize - WSIZE, PACK(0, 1));

  
  heap_listp = heap_listp + initsize - 2 * WSIZE - 2 * PTR_SIZE;
  //heap_listp now point to the  Prologue
  char * prologue_ptr =  heap_listp;
  // Prologue header and footer
  PUT(HDRP(prologue_ptr), PACK(prologue_size, 1));
  PUT(FTRP(prologue_ptr), PACK(prologue_size, 1));
  /*
   * here the prologue_ptr can be look as a ancher which concat the header and tail of free-list to form a ring, 
   * and the prologue_ptr itself will never be used as a free block
   */
  //init free linked list
  SET_SUCCR(prologue_ptr, prologue_ptr);
  SET_PREDR(prologue_ptr, prologue_ptr);
  /* Extend the empty heap with a free block of CHUNKSIZE bytes */
  if (( extend_heap(CHUNKSIZE)) == NULL)
    return -1;

  return 0;
}

/*
 * mm_malloc - Allocate a block with at least size bytes of payload
 */
void *mm_malloc(size_t size)
{
  size_t newsize;      /* Adjusted block size */
  size_t extendsize; /* Amount to extend heap if no fit */
  char *ptr;

  if (heap_listp == 0)
    if (mm_init() < 0)
    {
      fprintf(stderr, "mm_init failed.");
      return NULL;
    }
  /* Ignore spurious requests */
  if (size == 0)
    return NULL;

  /*
   * Since the predecessor and successor reside in the payload for free list,  
   * the size of payload was at least thow PTR_SIZE.
   */
  if(size < (PTR_SIZE << 1)){
    size = (PTR_SIZE << 1);
  }

 /* 
  * the allocator must adjust the requested block size to allow room for the header and the footer,  
  * and to satisfy the  alignment requirement. 
  */
  newsize = ALIGN(size +  (WSIZE << 1)  );

  /* Search the free list for a fit */
  if ((ptr = find_fit(newsize)) != NULL)
  {
    return place(ptr, newsize);
  }

  /* No fit found. Get more memory and place the block */
  extendsize = MAX(newsize, CHUNKSIZE);
  if ((ptr = extend_heap(extendsize)) == NULL)
    return NULL;
  return place(ptr, newsize);
}

/*
 * mm_free - Free a block
 */
void mm_free(void *ptr)
{
  if (ptr == 0)
    return;

  /*
   *if (!is_allocated(ptr) ) {
   *  printf("Free error: %p is not a allocated block\n", ptr);
   *  return;
   *}
   */

  size_t size = GET_SIZE(HDRP(ptr));
  if (heap_listp == 0)
    if (mm_init() < 0)
    {
      fprintf(stderr, "mm_init failed.");
      return;
    }


  PUT(HDRP(ptr), PACK(size, 0));
  PUT(FTRP(ptr), PACK(size, 0));
  coalesce(ptr);
}



/*
 * mm_realloc - Naive implementation of realloc
 */
void *mm_realloc1(void *ptr, size_t size)
{
  size_t oldsize;
  void *newptr;

  /* If size == 0 then this is just free, and we return NULL. */
  if (size == 0)
  {
    mm_free(ptr);
    return 0;
  }

  /* If oldptr is NULL, then this is just malloc. */
  if (ptr == NULL)
  {
    return mm_malloc(size);
  }

  /*if (!is_allocated(ptr) ) {*/
  /*printf("realloc error: %p is not a allocated block\n", ptr);*/
  /*return 0;*/
  /*}*/

  newptr = mm_malloc(size);

  /* If realloc() fails the original block is left untouched  */
  if (!newptr)
  {
    return 0;
  }

  /* Copy the old data. */
  oldsize = GET_SIZE(HDRP(ptr)) - (WSIZE << 1);
  if (size < oldsize) oldsize = size;
  memcpy(newptr, ptr, oldsize);

  /* Free the old block. */
  mm_free(ptr);

  return newptr;
}

void *mm_realloc2(void *ptr, size_t size)
{
  size_t oldsize, newsize, allocsize;
  void *newptr;

  /* If size == 0 then this is just free, and we return NULL. */
  if (size == 0)
  {
    mm_free(ptr);
    return 0;
  }

  /* If oldptr is NULL, then this is just malloc. */
  if (ptr == NULL)
  {
    return mm_malloc(size);
  }

  if(size < (PTR_SIZE << 1)){
    size = PTR_SIZE << 1;
  }

  allocsize = ALIGN(size +  (WSIZE << 1) );

  // 新块小于旧块的情况
  oldsize = GET_SIZE(HDRP(ptr));
  newsize = allocsize;
  if (newsize <= oldsize) {
    // no necessary to memcpy
    if ((oldsize - newsize) >= MIN_BLOCK_SIZE)
    {
      PUT(HDRP(ptr), PACK(newsize, 1));
      PUT(FTRP(ptr), PACK(newsize, 1));
      //printf("mm_realloc 1 ptr=%p, HDRP=%p, FTRP=%p\n",ptr, HDRP(ptr), FTRP(ptr));
      newptr = ptr;
      ptr = NEXT_BLKP(ptr);
      PUT(HDRP(ptr), PACK(oldsize - newsize, 0));
      PUT(FTRP(ptr), PACK(oldsize - newsize, 0));
     // printf("mm_realloc 2 ptr=%p, HDRP=%p, FTRP=%p\n",ptr, HDRP(ptr), FTRP(ptr));
      coalesce(ptr);
       
      return newptr;

    }
    else return ptr;

  }

  // 下一个相邻块空闲的情况
  newsize = oldsize;
  char *nptr = NEXT_BLKP(ptr);

  while(!GET_ALLOC(HDRP(nptr)) && GET_SIZE(HDRP(nptr)) > 0 && newsize < allocsize){
    newsize += GET_SIZE(HDRP(nptr));

    PUT(HDRP(ptr), PACK(newsize, 1));
    PUT(FTRP(ptr), PACK(newsize, 1));

    rm_fblock(nptr);
    nptr = NEXT_BLKP(ptr);
  }

  if(newsize >= allocsize){
    if(newsize-allocsize >= MIN_BLOCK_SIZE){
      PUT(HDRP(ptr), PACK(allocsize, 1));
      PUT(FTRP(ptr), PACK(allocsize, 1));
      newptr = ptr;
      ptr = NEXT_BLKP(ptr);
      PUT(HDRP(ptr), PACK(newsize-allocsize, 0));
      PUT(FTRP(ptr), PACK(newsize-allocsize, 0));
     // printf("mm_realloc 2 ptr=%p, HDRP=%p, FTRP=%p\n",ptr, HDRP(ptr), FTRP(ptr));
      coalesce(ptr);
      return newptr;
    } else return ptr;

  }
  
  // 不满足上面的两种情况
  newptr = mm_malloc(size);
  /* If realloc() fails the original block is left untouched  */
  if (!newptr)
  {
    return 0;
  }

  oldsize = oldsize - (WSIZE << 1);
  /* Copy the old data. */
  memcpy(newptr, ptr, oldsize);

  /* Free the old block. */
  mm_free(ptr);

  return newptr;
}

void *mm_realloc(void *ptr, size_t size){
  mm_realloc2(ptr, size);
}
/*
 * The remaining routines are internal helper routines
 */

/*
 * extend_heap - Extend heap with free block and return its block pointer
 */
/* $begin mmextendheap */
static void *extend_heap(size_t size)
{
  char *bp;

  if ((long)(bp = mem_sbrk(size)) == -1)
    return NULL;

  /* Initialize free block header/footer and the epilogue header */
  // 此时的HDRP(bp)就是epilogue
  PUT(HDRP(bp), PACK(size, 0));         /* Free block header */   
  PUT(FTRP(bp), PACK(size, 0));         /* Free block footer */
  PUT(HDRP(NEXT_BLKP(bp)), PACK(0, 1)); /* New epilogue header */

  /* Coalesce if the previous block was free */
  return coalesce(bp);
}

/*
 * Insert a free block to thre free linked-list
 * */
static void insert_fblock (void *bp)
{
  //后进先出的方式插入，即插入链表头位置

  // insert into the header of the free list
  SET_SUCCR(bp, GET_SUCCR(heap_listp)); //the successor of bp point to the old first free block
  SET_PREDR(GET_SUCCR(heap_listp), bp); //the predecessor of the old first free block point to bp
  SET_SUCCR(heap_listp, bp); // successor of the ancher(锚点) point to bp
  SET_PREDR(bp, heap_listp); //the predecessor of bp point to heap_listp

}
/**
 * remove a block form free linked-list
 */
static void rm_fblock(void *rbp)
{
  // the successor of the previous block of rbp point to next block of rbp
  SET_SUCCR(GET_PREDR(rbp), GET_SUCCR(rbp));
  // the predecessor of the next block of rbp point to previous block of rbp
  SET_PREDR(GET_SUCCR(rbp), GET_PREDR(rbp));
}

/*
 * 如果要释放的块的相邻的块也是空闲的要合并
 * coalesce - Boundary tag coalescing. Return ptr to coalesced block
 */
static void *coalesce(void *bp)
{
  char *nbp = NEXT_BLKP(bp);
  char *pbp = PREV_BLKP(bp);
  size_t prev_alloc = GET_ALLOC(FTRP(pbp));
  size_t next_alloc = GET_ALLOC(HDRP(nbp));
  size_t size = GET_SIZE(HDRP(bp));

  /* Case 1 */
  /*The previous and next blocks are both allocated.*/
  if (prev_alloc && next_alloc)
  {
    insert_fblock(bp);
    return bp;
  }
  /* Case 2 */
  /*The previous block is allocated and the next block is free.*/
  else if (prev_alloc && !next_alloc)
  {
    size += GET_SIZE(HDRP(nbp));
    PUT(HDRP(bp), PACK(size, 0));
    PUT(FTRP(bp), PACK(size, 0));

    rm_fblock(nbp);
    insert_fblock(bp);
  }
  /* Case 3 */
  /*The previous block is free and the next block is allocated.*/
  else if (!prev_alloc && next_alloc)
  {
    size += GET_SIZE(HDRP(pbp));
    PUT(FTRP(bp), PACK(size, 0));
    PUT(HDRP(pbp), PACK(size, 0));
    bp = pbp;
  }
  /* Case 4 */
  /*The previous and next blocks are both free.*/
  else
  {
    size += GET_SIZE(HDRP(pbp)) + GET_SIZE(FTRP(nbp));
    PUT(HDRP(pbp), PACK(size, 0));
    PUT(FTRP(nbp), PACK(size, 0));
    bp = pbp;
    rm_fblock(nbp);
  }

  return bp;
}

/*
 * place - Place block of size bytes at start of free block bp
 *         and split if remainder would be at least minimum block size
 */
static void* place(void *bp, size_t size)
{
  size_t csize = GET_SIZE(HDRP(bp));

  if ((csize - size) >= MIN_BLOCK_SIZE)
  {
    /*
    * if the left block size was greater than MIN_BLOCK_SIZE, split the original freee block
    */

    //free list keep no change
    PUT(HDRP(bp), PACK(csize - size, 0));
    PUT(FTRP(bp), PACK(csize - size, 0));
    bp = NEXT_BLKP(bp);
    PUT(HDRP(bp), PACK(size, 1));
    PUT(FTRP(bp), PACK(size, 1));
  }
  else
  {
    // mark allocateed
    PUT(HDRP(bp), PACK(csize, 1));
    PUT(FTRP(bp), PACK(csize, 1));
    rm_fblock(bp);
  }
  return bp;
}


/**
 * find_fit - Find a fit  block with size bytes
 */
static void *find_fit(size_t size)
{

  void *bp;

  for (bp = GET_SUCCR(heap_listp); bp != heap_listp; bp = GET_SUCCR(bp))
  {
    if (!GET_ALLOC(HDRP(bp)) && (size <= GET_SIZE(HDRP(bp))))
    {
      return bp;
    }
  }
  return NULL; /* No fit */
}

// =============================check heap========================


static int is_allocated(void *ptr)
{
  if (ptr == NULL)
    return 0;
  int is_alloced = 0;
  void *bp;
  for (bp = heap_listp; GET_SIZE(HDRP(bp)) > 0; bp = NEXT_BLKP(bp))
  {
    if ((ptr == bp) && GET_ALLOC(HDRP(bp)) )
    {
      is_alloced = 1;
      break;
    }
  }
  if (!is_alloced)
  {
    return 0;
  }
  return 1;

}

static void printblock(void *bp)
{
  size_t hsize, halloc, fsize, falloc;

  hsize = GET_SIZE(HDRP(bp));
  halloc = GET_ALLOC(HDRP(bp));
  fsize = GET_SIZE(FTRP(bp));
  falloc = GET_ALLOC(FTRP(bp));

  if (hsize == 0)
  {
    printf("%p: EOL\n", bp);
    return;
  }

  printf("%p: header: [%lx:%c] footer: [%lx:%c]\n",
      bp, hsize, (halloc ? 'a' : 'f'), fsize, (falloc ? 'a' : 'f'));
}

static int checkblock(void *bp)
{
  if (!IS_ALIGNED(bp))
  {
    printf("Error: %p is not doubleword aligned\n", bp);
    return 0;
  }
  //printf("bp=%p, HDRP=%p, FTRP=%p, size=%d\n", bp, HDRP(bp), FTRP(bp), GET_SIZE(HDRP(bp)));
  if (GET(HDRP(bp)) != GET(FTRP(bp)))
  {
    printf("Error: %p header does not match footer \n", bp);
    return 0;
  }
  return 1;
}

static int checkblocklist(int verbose)
{
  int valid = 1;
  int i =0;
  char *bp = heap_listp;

  if (verbose > 1)
    printf("Heap (%p):\n", heap_listp);

  /*if ((GET_SIZE(HDRP(heap_listp)) != 2 * WSIZE) || !GET_ALLOC(HDRP(heap_listp)))*/
  /*printf("Bad prologue header\n");*/

  for (bp = heap_listp; GET_SIZE(HDRP(bp)) > 0; bp = NEXT_BLKP(bp))
  {

    if (verbose > 1)
      printblock(bp);

    if (!checkblock(bp))
    {
      valid = 0;
      return valid;
    }
    i++;
  }

  if ((GET_SIZE(HDRP(bp)) != 0) || !(GET_ALLOC(HDRP(bp))))
  {
    printf("Bad epilogue header\n");
    valid = 0;
  }
  if (verbose > 1)
    printblock(bp);
  return valid;
}

void printfreeblock(void *bp)
{

}

void check_freelist()
{
  void *bp;

  for (bp = GET_SUCCR(heap_listp); bp != heap_listp; bp = GET_SUCCR(bp))
  {
    printfreeblock(bp);
  }

}
/*
 * mm_check - Minimal check of the heap for consistency
 */
int mm_checkheap(int verbose)
{
  return checkblocklist(verbose);
}
