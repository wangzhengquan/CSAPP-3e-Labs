/*
 * CS:APP Data Lab
 *
 * <Please put your name and userid here>
 *
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.
 */

//1
/*
 * bitXor - x^y using only ~ and &
 *   Example: bitXor(4, 5) = 1
 *   Legal ops: ~ &
 *   Max ops: 14
 *   Rating: 1
 */
int bitXor(int x, int y)
{

  /*int res = ~(x & y) & ~(~x & ~y);*/
  return ~(x & y) & ~(~x & ~y);
  /*fprintf(stder, "%d\n", res);*/
}
/*
 * tmin - return minimum two's complement integer
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 4
 *   Rating: 1
 */
int tmin(void)
{

  return 1 << 31;

}
//2
/*
 * isTmax - returns 1 if x is the maximum, two's complement number,
 *     and 0 otherwise
 *   Legal ops: ! ~ & ^ | +
 *   Max ops: 10
 *   Rating: 1
 */
int isTmax(int x)
{
  /*return !(~(1 << 31) ^ x);*/
  return !(~(x ^ (x + 1))) & !!(~x);
}
/*
 * allOddBits - return 1 if all odd-numbered bits in word set to 1
 *   where bits are numbered from 0 (least significant) to 31 (most significant)
 *   Examples allOddBits(0xFFFFFFFD) = 0, allOddBits(0xAAAAAAAA) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 2
 */
int allOddBits(int x)
{
  x &= x << 2;
  x &= x << 4;
  x &= x << 8;
  x &= x << 16;
  return !!(x & 1 << 31);
}
/*
 * negate - return -x
 *   Example: negate(1) = -1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 5
 *   Rating: 2
 */
int negate(int x)
{
  return ~x + 1;
}
//3
/*
 * isAsciiDigit - return 1 if 0x30 <= x <= 0x39 (ASCII codes for characters '0' to '9')
 *   Example: isAsciiDigit(0x35) = 1.
 *            isAsciiDigit(0x3a) = 0.
 *            isAsciiDigit(0x05) = 0.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 3
 */
int isAsciiDigit(int x)
{
  return !((~0x30 + 1 + x) >> 31 | (~x + 1 + 0x39) >> 31);
}
/*
 * conditional - same as x ? y : z
 *   Example: conditional(2,4,5) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 3
 *   (~!x) + 1 在x==0时值为-1 , x!=0时值为0
 */
int conditional(int x, int y, int z)
{
  return (~((~!x) + 1) & y) | (((~!x) + 1) & z);
}
/*
 * isLessOrEqual - if x <= y  then return 1, else return 0
 *   Example: isLessOrEqual(4,5) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
int isLessOrEqual(int x, int y)
{
  int diff = ~x + 1 + y;
  int sx = (x >> 31) ;
  int sy = (y >> 31) ;
  int se = sx ^ sy; //
  return (!!(se & sx )) | ((!(diff >> 31 & diff)) & ~se);
}
//4
/*
 * logicalNeg - implement the ! operator, using all of
 *              the legal operators except !
 *   Examples: logicalNeg(3) = 0, logicalNeg(0) = 1
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 4
 */
int logicalNeg(int x)
{
  x |= x >> 1;
  x |= x >> 2;
  x |= x >> 4;
  x |= x >> 8;
  x |= x >> 16;
  /*return ~(~(x & 1) + 1) & 1;*/
  return (x + 1) & 1;
}
/* howManyBits - return the minimum number of bits required to represent x in
 *             two's complement
 *  Examples: howManyBits(12) = 5
 *            howManyBits(298) = 10
 *            howManyBits(-5) = 4
 *            howManyBits(0)  = 1
 *            howManyBits(-1) = 1
 *            howManyBits(0x80000000) = 32
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 90
 *  Rating: 4
 */
int howManyBits(int x)
{
  int c16, c8, c4, c2, c1;

  x ^= (x >> 31);
  c16 = (!!(x >> 16)) << 4;
  x = x >> c16;
  c8 = (!!(x >> 8)) << 3;
  x = x >> c8;
  c4 = (!!(x >> 4)) << 2;
  x = x >> c4;
  c2 = (!!(x >> 2)) << 1;
  x = x >> c2;
  c1 = (!!(x >> 1));
  x = x >> c1;
  return c16 + c8 + c4 + c2 + c1 + x + 1;

}

/*int howManyBits1(int x)*/
/*{*/
/*x ^= (x >> 31);*/
/*x |= x >> 1;*/
/*x |= x >> 2;*/
/*x |= x >> 4;*/
/*x |= x >> 8;*/
/*x |= x >> 16;*/

/*x = (x & 0x55555555) + ((x >> 1) & 0x55555555);*/
/*x = (x & 0x33333333) + ((x >> 2) & 0x33333333);*/
/*x = (x & 0x0f0f0f0f) + ((x >> 4) & 0x0f0f0f0f);*/
/*x = (x & 0x00ff00ff) + ((x >> 8) & 0x00ff00ff);*/
/*x = (x & 0x0000ffff) + ((x >> 16) & 0x0000ffff);*/

/*return x + 1;*/
/*}*/
//float
/*
 * floatScale2 - Return bit-level equivalent of expression 2*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned floatScale2(unsigned uf)
{
  unsigned s = uf & (1 << 31);
  unsigned f = uf & 0x7fffff;
  unsigned e = (uf >> 23) & 0xff;
  if (e == 0xff)
  {
    return uf;
  }
  else if (e == 0)
  {
    f <<= 1;
  }
  else
  {
    e += 1;
  }
  return s | f | (e << 23);
}
/*
 * floatFloat2Int - Return bit-level equivalent of expression (int) f
 *   for floating point argument f.
 *   Argument is passed as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point value.
 *   Anything out of range (including NaN and infinity) should return
 *   0x80000000u.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
int floatFloat2Int(unsigned uf)
{
  unsigned s = (uf >> 31) & 1;
  unsigned f = uf & 0x7fffff;
  unsigned e = (uf >> 23) & 0xff;
  int E = e - 127;
  if (e == 0xff)
    return  0x80000000u;
  if (e == 0)
    return 0;
  if (E >= 31)
    return 0x80000000u;
  if (E < 0)
    return 0;

  f |= 1 << 23;
  if (E <= 23 )
    f >>= (23 - E);
  else if (E > 23)
    f <<= (E - 23);

  if (s)
    f = ~f + 1;

  return f;
}
/*
 * floatPower2 - Return bit-level equivalent of the expression 2.0^x
 *   (2.0 raised to the power x) for any 32-bit integer x.
 *
 *   The unsigned value that is returned should have the identical bit
 *   representation as the single-precision floating-point number 2.0^x.
 *   If the result is too small to be represented as a denorm, return
 *   0. If too large, return +INF.
 *
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. Also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned floatPower2(int x)
{
  unsigned e;
  int E;
  int f;

  if (x < -149)
    return 0;
  if (x > 127)
    return 0xff << 23;

  if (x <= -127)
  {
    E = -126;
    f = 1 << (126 + x + 23 );
  }
  else
  {
    E = x;
    f = 0;
  }

  e = E + 127;
  return (e << 23) | f;
}
