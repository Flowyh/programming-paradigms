function run_tests(x, a1, b1, a2, b2, c)
  println("==========FACTORIAL TEST==========");
  println("Argument x=$(x)");
  res = _factorial(x);
  println("Result (iterative): $(res)");
  res = _factorial_r(x);
  println("Result (recursive): $(res)");
  println("===========END OF TEST============");
  
  println("=============GCD TEST=============");
  println("Argument a=$(a1), b=$(b1)");
  res = _gcd(a1, b1);
  println("Result (iterative): $(res)");
  res = _gcd_r(a1, b1);
  println("Result (recursive): $(res)");
  println("===========END OF TEST============");
  
  println("=====DIOPHANTINE EQUATION TEST====");
  println("Argument a=$(a2), b=$(b2), c=$(c)")
  res = diophantine_equation(a2, b2, c);
  println("Result (iterative): x=$(res.x), y=$(res.y)")
  println("                    possible=$(res.possible)");
  res = diophantine_equation(a2, b2, c);
  println("Result (recursive): x=$(res.x), y=$(res.y)")
  println("                    possible=$(res.possible)");
  println("===========END OF TEST============");
end