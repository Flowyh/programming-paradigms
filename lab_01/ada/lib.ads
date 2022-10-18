with Interfaces.C;
use Interfaces.C;

package lib is

  type pair_llong is record
    x : long;
    y : long;
    possible : Boolean;
  end record;
  pragma Convention(C, pair_llong);

  function factorial(x : unsigned_long) return unsigned_long
    with Export,
         Convention => C,
         External_Name => "factorial";

  function factorial_r(x : unsigned_long) return unsigned_long
    with Export,
         Convention => C,
         External_Name => "factorial_r";

  function gcd(a : unsigned_long; b : unsigned_long) return unsigned_long
    with Export,
         Convention => C,
         External_Name => "gcd";

  function gcd_r(a : unsigned_long; b : unsigned_long) return unsigned_long
    with Export,
         Convention => C,
         External_Name => "gcd_r";

  function diophantine_equation(a: long; b: long; c: long) return pair_llong
    with Export,
         Convention => C,
         External_Name => "diophantine_equation";

  function diophantine_equation_r(a: long; b: long; c: long) return pair_llong
    with Export,
         Convention => C,
         External_Name => "diophantine_equation_r";

end lib;