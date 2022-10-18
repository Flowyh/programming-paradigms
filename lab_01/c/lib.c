#include "lib.h"
#include <stdlib.h>

uint64_t factorial(uint64_t x)
{
  if (x > 20)
    return 0;

  uint64_t res = 1;

  for (size_t i = 2; i <= x; i++)
    res *= i;

  return res;
}

uint64_t factorial_r(uint64_t x)
{
  if (x > 20)
    return 0;

  if (x <= 1)
    return 1;

  return x * factorial_r(x - 1);
}

uint64_t gcd(uint64_t a, uint64_t b)
{
  uint64_t temp = 0;
  while(b > 0)
  {
    temp = a;
    a = b;
    b = temp % b;
  }
  return a;
}

uint64_t gcd_r(uint64_t a, uint64_t b)
{
  if (b <= 0)
    return a;

  return gcd_r(b, a % b);
}

typedef struct egcd_res_t {
  int64_t _gcd;
  int64_t x;
  int64_t y;
} egcd_res_t;

static egcd_res_t extended_gcd(int64_t a, int64_t b)
{
  int64_t old_remainder = a, remainder = b;
  int64_t y = 0, y1 = 1;
  int64_t x = 1, x1 = 0;
  int64_t quot = 0, tmp = 0;

  while (remainder != 0)
  {
    quot = old_remainder / remainder;
    
    tmp = remainder;
    remainder = old_remainder - quot * tmp;
    old_remainder = tmp;
    
    tmp = x;
    x = x1;
    x1 = tmp - quot * x1;

    tmp = y;
    y = y1;
    y1 = tmp - quot * y1;
  }

  return (egcd_res_t) {old_remainder, x, y};
}

static egcd_res_t extended_gcd_r(int64_t a, int64_t b)
{
  if (b == 0)
    return (egcd_res_t) {a, 1, 0};

  egcd_res_t tmp = extended_gcd_r(b, a % b);

  return (egcd_res_t) {
    tmp._gcd,
    tmp.y,
    tmp.x - tmp.y * a / b
  };
}

pair_int64_t diophantine_equation(int64_t a, int64_t b, int64_t c)
{
  if (a == 0 && b == 0)
  {
    if (c == 0)
      return (pair_int64_t) {1, 1, true};
    else
      return (pair_int64_t) {0, 0, false};
  }

  egcd_res_t res = extended_gcd(a, b);

  if (c % res._gcd != 0)
    return (pair_int64_t) {0, 0, false};
  
  return (pair_int64_t) {
    res.x * c / res._gcd,
    res.y * c / res._gcd,
    true
  };
}

pair_int64_t diophantine_equation_r(int64_t a, int64_t b, int64_t c)
{
  if (a == 0 && b == 0)
  {
    if (c == 0)
      return (pair_int64_t) {1, 1, true};
    else
      return (pair_int64_t) {0, 0, false};
  }

  egcd_res_t res = extended_gcd_r(a, b);

  if (c % res._gcd != 0)
    return (pair_int64_t) {0, 0, false};
  
  return (pair_int64_t) {
    res.x * c / res._gcd,
    res.y * c / res._gcd,
    true
  };
}