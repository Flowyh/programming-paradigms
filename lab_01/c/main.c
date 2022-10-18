#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

typedef struct pair_int64_t {
  int64_t x;
  int64_t y;
  bool possible;
} pair_int64_t;

extern void adainit();
extern void adafinal();

extern uint64_t factorial(uint64_t x);
extern uint64_t factorial_r(uint64_t x);

extern uint64_t gcd(uint64_t a, uint64_t b);
extern uint64_t gcd_r(uint64_t a, uint64_t b);

extern pair_int64_t diophantine_equation(int64_t a, int64_t b, int64_t c);
extern pair_int64_t diophantine_equation_r(int64_t a, int64_t b, int64_t c);

#define FACTORIAL_TEST(x) do {                              \
  printf("==========FACTORIAL TEST==========\n");           \
  printf("Argument x=%ld\n", x);                            \
  uint64_t fact_res = factorial(x);                         \
  printf("Result (iterative): %ld\n", fact_res);            \
  fact_res = factorial_r(x);                                \
  printf("Result (recursive): %ld\n", fact_res);            \
  printf("===========END OF TEST============\n");           \
} while(0)

#define GCD_TEST(a, b) do {                                 \
  printf("=============GCD TEST=============\n");           \
  printf("Argument a=%ld, b=%ld\n", a, b);                  \
  uint64_t gcd_res = gcd(a, b);                             \
  printf("Result (iterative): %ld\n", gcd_res);             \
  gcd_res = gcd_r(a, b);                                    \
  printf("Result (recursive): %ld\n", gcd_res);             \
  printf("===========END OF TEST============\n");           \
} while(0)

#define DIOPHANTINE_EQUATION_TEST(a, b, c) do {             \
  printf("=====DIOPHANTINE EQUATION TEST====\n");           \
  printf("Argument a=%ld, b=%ld, c=%ld\n", a, b, c);        \
  pair_int64_t diop_res = diophantine_equation(a, b, c);    \
  printf("Result (recursive): x=%ld, y=%ld\n"               \
        "                    possible=%s\n",                \
          diop_res.x, diop_res.y,                           \
          diop_res.possible == 1 ? "True" : "False");       \
  diop_res = diophantine_equation_r(a, b, c);               \
  printf("Result (recursive): x=%ld, y=%ld\n"               \
        "                    possible=%s\n",                \
          diop_res.x, diop_res.y,                           \
          diop_res.possible == 1 ? "True" : "False");       \
  printf("===========END OF TEST============\n");           \
} while(0)

int main(int argc, char const *argv[])
{
  adainit();

  FACTORIAL_TEST((uint64_t){5});
  GCD_TEST((uint64_t){24}, (uint64_t){15});
  DIOPHANTINE_EQUATION_TEST((uint64_t){12}, (uint64_t){73}, (uint64_t){96});

  adafinal();
  return 0;
}