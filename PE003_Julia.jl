#=
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
=#

include("math_tools.jl")

import math_tools: 
	prime_factorize

factors = prime_factorize(600851475143)

ans = maximum(factors)

println(ans)

