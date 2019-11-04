/* 
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */ 
#include <stdio.h>
#include "cachelab.h"


int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. 
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
    int BLOCK = 32 * 8 / M;
    if ((32 * 8) % M != 0 ) {
      BLOCK = 8;
    }

    /*printf("BLOCK=%d\n", BLOCK);*/
    int i, j;
    int a, b;

    for (i = 0; i <= N - BLOCK; i += BLOCK) {
        for (j = 0; j <= M - BLOCK; j += BLOCK)
          for (a = i; a < i + BLOCK; a++)
            for (b = j; b < j + BLOCK; b++)
              B[b][a] = A[a][b];

        for (; j < M; j++)
          for (a = i; a < i + BLOCK; a++)
            B[j][a] = A[a][j];
    }

    for (; i < N; i++) {
        for (j = 0; j <= M - BLOCK; j += BLOCK)
          for (b = j; b < j+BLOCK; b++)
              B[b][i] = A[i][b];

        for (; j < M; j++)
          B[j][i] = A[i][j];
    }

}

char transpose_effective1_desc[] = "Transpose effective1";
void transpose_effective1(int M, int N, int A[N][M], int B[M][N])
{
    int BLOCK = 32 * 8 / M;
    if ((32 * 8) % M != 0 ) {
      BLOCK = 8;
    }

    /*printf("BLOCK=%d\n", BLOCK);*/
    int i, j;
    int a, b;

    for (i = 0; i <= N - BLOCK; i += BLOCK) {
        for (j = 0; j <= M - BLOCK; j += BLOCK)
          for (a = i; a < i + BLOCK; a++)
            for (b = j; b < j + BLOCK; b++)
               B[b][a] = A[a][b];

        for (; j < M; j++)
          for (a = i; a < i + BLOCK; a++)
              B[j][a] = A[a][j];
    }

    for (; i < N; i++) {
        for (j =0; j < M; j++)
            B[j][i] = A[i][j];
    }
}

char transpose_effective2_desc[] = "Transpose effective2";
void transpose_effective2(int M, int N, int A[N][M], int B[M][N])
{
   
    int BLOCK = 32 * 8 / M;
    if ((32 * 8) % M != 0 ) {
      BLOCK = 8;
    }

    //printf("BLOCK=%d\n", BLOCK);

    int i, j;
    int a, b;

    for (i = 0; i <= N - BLOCK; i += BLOCK) {
        for (j = 0; j <= M - BLOCK; j += BLOCK)
          for (a = i; a < i + BLOCK; a++) {
            for (b = j + a-i; b >=j; b--)
              B[a][b] = A[b][a];
            for (b = j + a-i +1; b < j + BLOCK; b++)
              B[a][b] = A[b][a];
          
          }

        for (; j < M; j++)
          for (a = i; a < i + BLOCK; a++)
              B[j][a] = A[a][j];
    }

    for (; i < N; i++) {
        for (j =0; j < M; j++)
            B[j][i] = A[i][j];
    }


}

/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */ 

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }

}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    registerTransFunction(trans, trans_desc); 
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc); 
    /* Register any additional transpose functions */
    registerTransFunction(transpose_effective2, transpose_effective2_desc); 

}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}

