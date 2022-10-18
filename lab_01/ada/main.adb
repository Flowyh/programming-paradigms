with Interfaces.C;
use Interfaces.C;

with Ada.Text_IO;
use Ada.Text_IO;

with lib;
use lib;

procedure main is
  x : unsigned_long := 5;
  a1 : unsigned_long := 24;
  b1 : unsigned_long := 15;
  a2 : long := 12;
  b2 : long := 73;
  c : long := 96;
  res : unsigned_long := 0;
  dio : pair_llong := (x => 0, y => 0, possible => False);
begin
  Put_Line("==========FACTORIAL TEST==========");
  Put_Line("Argument x=" & unsigned_long'Image(x));
  res := factorial(x);
  Put_Line("Result (iterative):" & unsigned_long'Image(res));
  res := factorial_r(x);
  Put_Line("Result (recursive):" & unsigned_long'Image(res));
  Put_Line("===========END OF TEST============");

  Put_Line("=============GCD TEST=============");
  Put_Line("Argument a=" & unsigned_long'Image(a1) & ", b=" & unsigned_long'Image(b1));
  res := gcd(a1, b1);
  Put_Line("Result (iterative):" & unsigned_long'Image(res));
  res := gcd_r(a1, b1);
  Put_Line("Result (recursive):" & unsigned_long'Image(res));
  Put_Line("===========END OF TEST============");
  
  Put_Line("=====DIOPHANTINE EQUATION TEST====");
  Put_Line("Argument a=" & long'Image(a2) & ", b=" & long'Image(b2) & ", c=" & long'Image(c));
  dio := diophantine_equation(a2, b2, c);
  Put_Line("Result (iterative): x=" & long'Image(dio.x) & ", y=" & long'Image(dio.y));
  Put_Line("                    possible=" & Boolean'Image(dio.possible));
  dio := diophantine_equation_r(a2, b2, c);
  Put_Line("Result (recursive): x=" & long'Image(dio.x) & ", y=" & long'Image(dio.y));
  Put_Line("                    possible=" & Boolean'Image(dio.possible));
  Put_Line("===========END OF TEST============");
end;