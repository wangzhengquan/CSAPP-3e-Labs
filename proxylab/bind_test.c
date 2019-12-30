#include <stdio.h>

typedef int (*add_t) (int x);

add_t add2(int x) {
  int add1(int y) {
    return x + y; 
  }
  return add1;
}

int main() {
  printf("%d\n", add2(2)(3));
}
