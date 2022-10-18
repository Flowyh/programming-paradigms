using Libdl

struct PairInt64
  x::Int64
  y::Int64
  possible::Bool
end

function _factorial(x::UInt64)::UInt64
  f = dlsym(library, "factorial")
  return ccall(f, UInt64, (UInt64,), x)
end

function _factorial_r(x::UInt64)::UInt64
  f = dlsym(library, "factorial_r")
  return ccall(f, UInt64, (UInt64,), x)
end


function _gcd(a::UInt64, b::UInt64)::UInt64
  f = dlsym(library, "gcd")
  return ccall(f, UInt64, (UInt64, UInt64), a, b)
end

function _gcd_r(a::UInt64, b::UInt64)::UInt64
  f = dlsym(library, "gcd_r")
  return ccall(f, UInt64, (UInt64, UInt64), a, b)
end

function diophantine_equation(a::Int64, b::Int64, c::Int64)::PairInt64
  f = dlsym(library, "diophantine_equation")
  return ccall(f, PairInt64, (Int64, Int64, Int64), a, b, c)
end

function diophantine_equation_r(a::Int64, b::Int64, c::Int64)::PairInt64
  f = dlsym(library, "diophantine_equation_r")
  return ccall(f, PairInt64, (Int64, Int64, Int64), a, b, c)
end



include("./run_tests.jl")

function main()
  run(`gcc -fpic -shared ../c/lib.c -o lib.so`)
  global library = dlopen("./lib.so")

  run_tests(UInt64(5), UInt64(24), UInt64(15), 12, 73, 96)
  run(`rm -f lib.so`)
end

if abspath(PROGRAM_FILE) == @__FILE__
  main()
end