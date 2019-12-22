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
  "Harry Bovik",
  /* First member's email address */
  "bovik@cs.cmu.edu",
  /* Second member's full name (leave blank if none) */
  "",
  /* Second member's email address (leave blank if none) */
  ""
};

/* $begin mallocmacros */
/* single word (4) or double word (8) alignment */
#define ALIGNMENT 8

/* rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(size) (((size_t)(size) + (ALIGNMENT-1)) & ~(ALIGNMENT - 1))

/* Returns true if p is ALIGNMENT-byte aligned */
#define IS_ALIGNED(p)  ((((size_t)(p)) & (ALIGNMENT - 1)) == 0)

/*
 * If NEXT_FIT defined use next fit search, else use first-fit search
 */
//#define NEXT_FITx

/* Basic constants and macros */
#define SIZE_T_SIZE (sizeof(size_t))

#define PTR_SIZE (sizeof(void *))

#define MIN_BLOCK_SIZE (ALIGN( (SIZE_T_SIZE << 1) + SIZE_T_SIZE + (PTR_SIZE << 1) ))

#define CHUNKSIZE  (1<<12)  /* Extend heap by this amount (bytes) */  //line:vm:mm:endconst 

#define MAX(x, y) ((x) > (y)? (x) : (y))

/* Pack a size and allocated bit into a word */
#define PACK(size, alloc)  ((size) | (alloc)) //line:vm:mm:pack

/* Read and write a word at address p */
#define GET(p)       (*(size_t *)(p))
#define PUT(p, val)  (*(size_t *)(p) = (val))
#define GET_PTR(p)       (*(char **)(p))
#define PUT_PTR(p, val)  (*(char **)(p) = (val))

/* Read the size and allocated fields from address p */
#define GET_SIZE(p)  (GET(p) & ~0x7)                   //line:vm:mm:getsize
#define GET_ALLOC(p) (GET(p) & 0x1)                    //line:vm:mm:getalloc

/* Given block ptr bp, compute address of its header and footer */
#define HDRP(bp)       ((char *)(bp) - SIZE_T_SIZE)                      //line:vm:mm:hdrp
#define FTRP(bp)       ((char *)(bp) + GET_SIZE(HDRP(bp)) - 2 * SIZE_T_SIZE) //line:vm:mm:ftrp
#define SUCCRP(bp)       ((char **)(bp) + 1)                      //line:vm:mm:hdrp
#define PREDRP(bp)       ((char **)(bp))                      //line:vm:mm:hdrp
//#define FIRSTER(heap_listp)       ((char **)(heap_listp))
//#define LASTER(heap_listp)       ((char **)(heap_listp) + 1)

/* Given block ptr bp, compute address of next and previous blocks */
#define NEXT_BLKP(bp)  ((char *)(bp) + GET_SIZE(((char *)(bp) - SIZE_T_SIZE))) //line:vm:mm:nextblkp
#define PREV_BLKP(bp)  ((char *)(bp) - GET_SIZE(((char *)(bp) - 2 * SIZE_T_SIZE))) //line:vm:mm:prevblkp
#define NEXT_FBLKP(bp) (*SUCCRP(bp))
#define PREV_FBLKP(bp) (*PREDRP(bp))

/* $end mallocmacros */

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

  newsize = ALIGN(size +  (SIZE_T_SIZE << 1) +  (PTR_SIZE << 1) );

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
void *mm_realloc(void *ptr, size_t size)
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
  oldsize = GET_SIZE(HDRP(ptr));
  if (size < oldsize) oldsize = size;
  memcpy(newptr, ptr, oldsize);

  /* Free the old block. */
  mm_free(ptr);

  return newptr;
}
/*
 * The remaining routines are internal helper routines
 */

/*
 * mm_init - Initialize the memory manager
 */
int mm_init(void)
{
  void *free_listp;
  /* Create the initial empty heap */
  int initsize = ALIGN(3 * SIZE_T_SIZE + 2 * PTR_SIZE);
  if ((heap_listp = mem_sbrk(initsize)) == (void *) - 1)
    return -1;
  PUT(heap_listp + initsize - SIZE_T_SIZE, PACK(0, 1));   /* Epilogue header */
  heap_listp = heap_listp + initsize - 2 * SIZE_T_SIZE - 2 * PTR_SIZE;
  PUT(HDRP(heap_listp), PACK(initsize - SIZE_T_SIZE, 1));
  PUT(FTRP(heap_listp), PACK(initsize - SIZE_T_SIZE, 1));
  /**
   * here the heap_listp can be look as a ancher which concat the header and tail of free-list to form a ring, and the heap_list itself will never be used as a free block
  */
  PUT_PTR(SUCCRP(heap_listp), heap_listp);
  PUT_PTR(PREDRP(heap_listp), heap_listp);
  /* Extend the empty heap with a free block of CHUNKSIZE bytes */
  if ((free_listp = extend_heap(CHUNKSIZE)) == NULL)
    return -1;

  return 0;
}
/*
 * extend_heap - Extend heap with free block and return its block pointer
 */
/* $begin mmextendheap */
static void *extend_heap(size_t size)
{
  char *bp;
  size = ALIGN(size);

  if ((long)(bp = mem_sbrk(size)) == -1)
    return NULL;                                        //line:vm:mm:endextend

  /* Initialize free block header/footer and the epilogue header */
  PUT(HDRP(bp), PACK(size, 0));         /* Free block header */   //line:vm:mm:freeblockhdr
  PUT(FTRP(bp), PACK(size, 0));         /* Free block footer */   //line:vm:mm:freeblockftr
  PUT(HDRP(NEXT_BLKP(bp)), PACK(0, 1)); /* New epilogue header */ //line:vm:mm:newepihdr

  /* Coalesce if the previous block was free */
  return coalesce(bp);                                          //line:vm:mm:returnblock
}

static void insert_fblock (void *bp)
{
  //后进先出的方式插入，即插入链表头位置

  // insert into the header of the free list
  PUT_PTR(SUCCRP(bp), NEXT_FBLKP(heap_listp)); //the successor of bp point to the old first free block
  PUT_PTR(PREDRP(NEXT_FBLKP(heap_listp)), bp); //the predecessor of the old first free block point to bp
  PUT_PTR(SUCCRP(heap_listp), bp); // successor of the ancher(锚点) point to bp
  PUT_PTR(PREDRP(bp), heap_listp); //the predecessor of bp point to heap_listp

}
/**
 * remove a block form free list
 */
static void rm_fblock(void *rbp)
{
  // the successor of the previous block of rbp point to next block of rbp
  PUT_PTR(SUCCRP(PREV_FBLKP(rbp)), NEXT_FBLKP(rbp));
  // the predecessor of then next block of rbp point to previous block of rbp
  PUT_PTR(PREDRP(NEXT_FBLKP(rbp)), PREV_FBLKP(rbp));
}
/*
 * coalesce - Boundary tag coalescing. Return ptr to coalesced block
 */
static void *coalesce(void *bp)
{
  char *nbp = NEXT_BLKP(bp);
  char *pbp = PREV_BLKP(bp);
  size_t prev_alloc = GET_ALLOC(FTRP(pbp));
  size_t next_alloc = GET_ALLOC(HDRP(nbp));
  size_t size = GET_SIZE(HDRP(bp));


  if (prev_alloc && next_alloc)              /* Case 1 */
  {
    insert_fblock(bp);
    return bp;
  }

  else if (prev_alloc && !next_alloc)        /* Case 2 */
  {
    size += GET_SIZE(HDRP(nbp));
    PUT(HDRP(bp), PACK(size, 0));
    PUT(FTRP(bp), PACK(size, 0));

    rm_fblock(nbp);
    insert_fblock(bp);
  }

  else if (!prev_alloc && next_alloc)        /* Case 3 */
  {
    size += GET_SIZE(HDRP(pbp));
    PUT(FTRP(bp), PACK(size, 0));
    PUT(HDRP(pbp), PACK(size, 0));
    bp = pbp;
  }

  else                                       /* Case 4 */
  {
    nbp = nbp;
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

/*
 * find_fit - Find a fit for a block with size bytes
 */
static void *find_fit(size_t size)
{

  void *bp;

  for (bp = NEXT_FBLKP(heap_listp); bp != heap_listp; bp = NEXT_FBLKP(bp))
  {
    if (!GET_ALLOC(HDRP(bp)) && (size <= GET_SIZE(HDRP(bp))))
    {
      return bp;
    }
  }
  return NULL; /* No fit */
}

// =============================check heap========================
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
  if (GET(HDRP(bp)) != GET(FTRP(bp)))
  {
    printf("Error: header does not match footer\n");
    return 0;
  }
  return 1;
}

static int checkblocklist(int verbose)
{
  int valid = 1;
  char *bp = heap_listp;

  if (verbose > 1)
    printf("Heap (%p):\n", heap_listp);

  /*if ((GET_SIZE(HDRP(heap_listp)) != 2 * SIZE_T_SIZE) || !GET_ALLOC(HDRP(heap_listp)))*/
  /*printf("Bad prologue header\n");*/

  for (bp = heap_listp; GET_SIZE(HDRP(bp)) > 0; bp = NEXT_BLKP(bp))
  {
    if (verbose > 1)
      printblock(bp);

    if (!checkblock(bp))
    {
      valid = 0;
    }
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

  for (bp = NEXT_FBLKP(heap_listp); bp != heap_listp; bp = NEXT_FBLKP(bp))
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
