#ifndef LIB_H

#include <stdint.h>
#include <stdbool.h>

typedef struct pair_int64_t {
  int64_t x;
  int64_t y;
  bool possible;
} pair_int64_t;

uint64_t factorial(uint64_t x);
uint64_t factorial_r(uint64_t x);

uint64_t gcd(uint64_t a, uint64_t b);
uint64_t gcd_r(uint64_t a, uint64_t b);

pair_int64_t diophantine_equation(int64_t a, int64_t b, int64_t c);
pair_int64_t diophantine_equation_r(int64_t a, int64_t b, int64_t c);

#endif // !LIB_H