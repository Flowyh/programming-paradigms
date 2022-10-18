include("./lib.jl")
using .Lib

include("./run_tests.jl")

function main()
  run_tests(UInt64(5), UInt64(24), UInt64(15), 12, 73, 96)
end

if abspath(PROGRAM_FILE) == @__FILE__
  main()
end