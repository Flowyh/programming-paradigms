with Interfaces.C;
use Interfaces.C;

package body lib is

  -- FACTORIAL

  function factorial(x : unsigned_long) return unsigned_long is
    res : unsigned_long := 1;
  begin
    if (x > 20) then
      return 0;
    end if;

    if (x = 0) then
      return 1;
    end if;

    for i in 2..x loop
      res := res * i;
    end loop;

    return res;
  end;

  function factorial_r(x : unsigned_long) return unsigned_long is
  begin
    if (x > 20) then
      return 0;
    end if;

    if (x <= 1) then
      return 1;
    end if;

    return x * factorial_r(x - 1);
  end;

  -- GCD

  function gcd(a : unsigned_long; b : unsigned_long) return unsigned_long is
    x : unsigned_long := a;
    y : unsigned_long := b;
    temp : unsigned_long := 0;
  begin
    while (y > 0) loop
      temp := x;
      x := y;
      y := temp mod y;
    end loop;

    return x;
  end;

  function gcd_r(a : unsigned_long; b : unsigned_long) return unsigned_long is
  begin
    if (b /= 0) then
      return gcd_r(b, a mod b);
    end if;

    return a;
  end;

  -- EXTENDED GCD

  type egcd_result is record
    gcd : long;
    x : long;
    y: long;
  end record;

  function extended_gcd(a : long; b : long) return egcd_result is
    old_remainder : long := a; remainder : long := b;
    y : long := 0; y1 : long := 1;
    x : long := 1; x1 : long := 0;
    quot : long := 0; tmp : long := 0;
    res : egcd_result := (gcd => 0, x => 0, y => 0);
  begin
    while (remainder /= 0) loop
      quot := long(old_remainder / remainder);
      
      tmp := remainder;
      remainder := old_remainder - quot * tmp;
      old_remainder := tmp;
      
      tmp := x;
      x := x1;
      x1 := tmp - quot * x1;

      tmp := y;
      y := y1;
      y1 := tmp - quot * y1;
    end loop;

    res := (gcd => old_remainder, x => x, y => y);

    return res;
  end;

  function extended_gcd_r(a : long; b : long) return egcd_result is
    res : egcd_result := (gcd => 0, x => 0, y => 0);
    tmp : egcd_result := (gcd => 0, x => 0, y => 0);
  begin
    if (b = 0) then
      res := (gcd => a, x => 1, y => 0);
      return res;
    end if;

    tmp := extended_gcd_r(b, a mod b);

    res := (
      gcd => tmp.gcd, 
      x => tmp.y, 
      y => tmp.x - tmp.y * long(a / b)
    );

    return res;
  end;

  -- DIOPHANTINE EQUATION

  function diophantine_equation(a : long; b : long; c : long) return pair_llong is
    egcd_res : egcd_result := (gcd => 0, x => 0, y => 0);
    res : pair_llong := (x => 0, y => 0, possible => False);
  begin
    if (a = 0 and b = 0) then
      if (c = 0) then
        res := (x => 1, y => 1, possible => True);
        return res;
      else
        return res;
      end if;
    end if;

    egcd_res := extended_gcd(a, b);

    if (c mod egcd_res.gcd /= 0) then
      return res;
    end if;

    res := (
      x => egcd_res.x * long(c / egcd_res.gcd), 
      y => egcd_res.y * long(c / egcd_res.gcd), 
      possible => True
    );

    return res;
  end;

  function diophantine_equation_r(a : long; b : long; c : long) return pair_llong is
    egcd_res : egcd_result := (gcd => 0, x => 0, y => 0);
    res : pair_llong := (x => 0, y => 0, possible => False);
  begin
    if (a = 0 and b = 0) then
      if (c = 0) then
        res := (x => 1, y => 1, possible => True);
        return res;
      else
        return res;
      end if;
    end if;

    egcd_res := extended_gcd_r(a, b);

    if (c mod egcd_res.gcd /= 0) then
      return res;
    end if;

    res := (
      x => egcd_res.x * long(c / egcd_res.gcd), 
      y => egcd_res.y * long(c / egcd_res.gcd), 
      possible => True
    );

    return res;
  end;

end lib;