#=
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
=#

include("math_tools.jl")

import math_tools: is_prime

primes = Int64[2]

for x in 3:2:Int(2e6)
	if is_prime(x) == true
		push!(primes, x)
	end
end

ans = sum(primes)

println(ans)

# real	0m1.039s
# user	0m1.018s
# sys	0m0.163s