/*
 * mm-naive.c - The fastest, least memory-efficient malloc package.
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
/* single word (4) or double word (8) alignment */
#define ALIGNMENT 8

/* rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(size) (((size) + (ALIGNMENT-1)) & ~(ALIGNMENT - 1))

/* Returns true if p is ALIGNMENT-byte aligned */
#define IS_ALIGNED(p)  ((((size_t)(p)) & (ALIGNMENT - 1)) == 0)

#define SIZE_T_SIZE (sizeof(size_t))
//#define SIZE_T_SIZE 4

#define MIN_BLOCK_SIZE (ALIGN(3 * SIZE_T_SIZE))
/*
 * If NEXT_FIT defined use next fit search, else use first-fit search
 */
//#define NEXT_FITx

/* Basic constants and macros */
//#define WSIZE       4       /* Word and header/footer size (bytes) */ //line:vm:mm:beginconst
//#define DSIZE       8       /* Double word size (bytes) */
#define CHUNKSIZE  (1<<12)  /* Extend heap by this amount (bytes) */  //line:vm:mm:endconst 

#define MAX(x, y) ((x) > (y)? (x) : (y))

/* Pack a size and allocated bit into a word */
#define PACK(size, alloc)  ((size) | (alloc)) //line:vm:mm:pack

/* Read and write a word at address p */
#define GET(p)       (*(size_t *)(p))            //line:vm:mm:get
#define PUT(p, val)  (*(size_t *)(p) = (val))    //line:vm:mm:put

/* Read the size and allocated fields from address p */
#define GET_SIZE(p)  (GET(p) & ~(ALIGNMENT - 1))
#define GET_ALLOC(p) (GET(p) & 0x1)                    //line:vm:mm:getalloc

/* Given block ptr bp, compute address of its header and footer */
#define HDRP(bp)       ((char *)(bp) - SIZE_T_SIZE)                      //line:vm:mm:hdrp
#define FTRP(bp)       ((char *)(bp) + GET_SIZE(HDRP(bp)) - 2 * SIZE_T_SIZE) //line:vm:mm:ftrp

/* Given block ptr bp, compute address of next and previous blocks */
#define NEXT_BLKP(bp)  ((char *)(bp) + GET_SIZE(((char *)(bp) - SIZE_T_SIZE))) //line:vm:mm:nextblkp
#define PREV_BLKP(bp)  ((char *)(bp) - GET_SIZE((char *)(bp) - 2 * SIZE_T_SIZE)) //line:vm:mm:prevblkp
/* $end mallocmacros */

/* Global variables */
static char *heap_listp = 0;  /* Pointer to first block */
#ifdef NEXT_FIT
static char *rover;           /* Next fit rover */
#endif

/* Function prototypes for internal helper routines */
static void *extend_heap(size_t words);
static void place(void *bp, size_t size);
static void *find_fit(size_t size);
static void *coalesce(void *bp);
static void printblock(void *bp);
static int is_allocated(void *bp);

/*
 * mm_init - Initialize the memory manager
 */
int mm_init(void)
{
  /* Create the initial empty heap */
  int initsize = ALIGN(3 * SIZE_T_SIZE);
  if ((heap_listp = mem_sbrk(initsize)) == (void *) - 1)
    return -1;
  PUT(heap_listp, 0);                          /* Alignment padding */
  PUT(heap_listp + initsize - SIZE_T_SIZE, PACK(0, 1));   /* Epilogue header */
  PUT(heap_listp + initsize - 2 * SIZE_T_SIZE, PACK(2 * SIZE_T_SIZE, 1)); /* Prologue footer */
  PUT(heap_listp + initsize - 3 * SIZE_T_SIZE, PACK(2 * SIZE_T_SIZE, 1)); /* Prologue header */

  heap_listp = heap_listp + initsize - 2*SIZE_T_SIZE;                   //line:vm:mm:endinit

#ifdef NEXT_FIT
  rover = heap_listp;
#endif

  /* Extend the empty heap with a free block of CHUNKSIZE bytes */
  if (extend_heap(CHUNKSIZE) == NULL)
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
  {
    mm_init();
  }
  /* Ignore spurious requests */
  if (size == 0)
    return NULL;

  newsize = ALIGN(size + 2 * SIZE_T_SIZE);

  /* Search the free list for a fit */
  if ((ptr = find_fit(newsize)) != NULL)
  {
    place(ptr, newsize);
    return ptr;
  }

  /* No fit found. Get more memory and place the block */
  extendsize = MAX(newsize, CHUNKSIZE);
  if ((ptr = extend_heap(extendsize)) == NULL)
    return NULL;
  place(ptr, newsize);
  return ptr;
}

/*
 * mm_free - Free a block
 */
void mm_free(void *ptr)
{
  if (ptr == 0)
    return;

  if (!is_allocated(ptr) ) {
    printf("Free error: %p is not a allocated block\n", ptr);
    return;
  }

  size_t size = GET_SIZE(HDRP(ptr));
  if (heap_listp == 0)
  {
    mm_init();
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

  if (!is_allocated(ptr) ) {
    printf("realloc error: %p is not a allocated block\n", ptr);
    return 0;
  }

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
/* $end mmfree */
/*
 * coalesce - Boundary tag coalescing. Return ptr to coalesced block
 */
/* $begin mmfree */
static void *coalesce(void *bp)
{
  size_t prev_alloc = GET_ALLOC(FTRP(PREV_BLKP(bp)));
  size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(bp)));
  size_t size = GET_SIZE(HDRP(bp));

  if (prev_alloc && next_alloc)              /* Case 1 */
  {
    return bp;
  }

  else if (prev_alloc && !next_alloc)        /* Case 2 */
  {
    size += GET_SIZE(HDRP(NEXT_BLKP(bp)));
    PUT(HDRP(bp), PACK(size, 0));
    PUT(FTRP(bp), PACK(size, 0));
  }

  else if (!prev_alloc && next_alloc)        /* Case 3 */
  {
    size += GET_SIZE(HDRP(PREV_BLKP(bp)));
    PUT(FTRP(bp), PACK(size, 0));
    PUT(HDRP(PREV_BLKP(bp)), PACK(size, 0));
    bp = PREV_BLKP(bp);
  }

  else                                       /* Case 4 */
  {
    size += GET_SIZE(HDRP(PREV_BLKP(bp))) +
            GET_SIZE(FTRP(NEXT_BLKP(bp)));
    PUT(HDRP(PREV_BLKP(bp)), PACK(size, 0));
    PUT(FTRP(NEXT_BLKP(bp)), PACK(size, 0));
    bp = PREV_BLKP(bp);
  }
  /* $end mmfree */
#ifdef NEXT_FIT
  /* Make sure the rover isn't pointing into the free block */
  /* that we just coalesced */
  if ((rover > (char *)bp) && (rover < NEXT_BLKP(bp)))
    rover = bp;
#endif
  /* $begin mmfree */
  return bp;
}

/*
 * place - Place block of size bytes at start of free block bp
 *         and split if remainder would be at least minimum block size
 */
static void place(void *bp, size_t size)
{
  size_t csize = GET_SIZE(HDRP(bp));

  if ((csize - size) >= MIN_BLOCK_SIZE)
  {
    PUT(HDRP(bp), PACK(size, 1));
    PUT(FTRP(bp), PACK(size, 1));
    bp = NEXT_BLKP(bp);
    PUT(HDRP(bp), PACK(csize - size, 0));
    PUT(FTRP(bp), PACK(csize - size, 0));
  }
  else
  {
    PUT(HDRP(bp), PACK(csize, 1));
    PUT(FTRP(bp), PACK(csize, 1));
  }
}

/*
 * find_fit - Find a fit for a block with size bytes
 */
static void *find_fit(size_t size)
{

#ifdef NEXT_FIT
  /* Next fit search */
  char *oldrover = rover;

  /* Search from the rover to the end of list */
  for ( ; GET_SIZE(HDRP(rover)) > 0; rover = NEXT_BLKP(rover))
    if (!GET_ALLOC(HDRP(rover)) && (size <= GET_SIZE(HDRP(rover))))
      return rover;

  /* search from start of list to old rover */
  for (rover = heap_listp; rover < oldrover; rover = NEXT_BLKP(rover))
    if (!GET_ALLOC(HDRP(rover)) && (size <= GET_SIZE(HDRP(rover))))
      return rover;

  return NULL;  /* no fit found */
#else
  /* $begin mmfirstfit */
  /* First-fit search */
  void *bp;

  for (bp = heap_listp; GET_SIZE(HDRP(bp)) > 0; bp = NEXT_BLKP(bp))
  {
    if (!GET_ALLOC(HDRP(bp)) && (size <= GET_SIZE(HDRP(bp))))
    {
      return bp;
    }
  }
  return NULL; /* No fit */
#endif
}

int is_allocated(void *ptr) {
  if (ptr == NULL)
    return 0;
  int is_alloced= 0;
  void *bp;
  for (bp = heap_listp; GET_SIZE(HDRP(bp)) > 0; bp = NEXT_BLKP(bp))
  {
    if ((ptr == bp) && GET_ALLOC(HDRP(bp)) ) {
      is_alloced = 1;
      break;
    }
  }
  if (!is_alloced) {
    return 0;
  }
  return 1;

}

/*DEBUG*/
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

  printf("%p: header: [%ld:%c] footer: [%ld:%c]\n",
         bp, hsize, (halloc ? 'a' : 'f'), fsize, (falloc ? 'a' : 'f'));
//  fflush(stdout);
}


int checkblock(void *bp)
{
  if (!IS_ALIGNED(bp)) {
    printf("Error: %p is not doubleword aligned\n", bp);
    return 0;
  }
  if (GET(HDRP(bp)) != GET(FTRP(bp))) {
    printf("Error: header does not match footer\n");
    return 0;
  }

  return 1;
}

/*
 * mm_check - Minimal check of the heap for consistency
 */
void mm_checkheap(int verbose)
{
  char *bp = heap_listp;

  printf("Heap (%p):\n", heap_listp);

  if ((GET_SIZE(HDRP(heap_listp)) != 2 * SIZE_T_SIZE) || !GET_ALLOC(HDRP(heap_listp)))
    printf("Bad prologue header\n");

  for (bp = heap_listp; GET_SIZE(HDRP(bp)) > 0; bp = NEXT_BLKP(bp))
  {
    checkblock(bp);
    printblock(bp);
  }

  if ((GET_SIZE(HDRP(bp)) != 0) || !(GET_ALLOC(HDRP(bp))))
    printf("Bad epilogue header\n");
  printblock(bp);
}
