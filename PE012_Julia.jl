#=
The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

Let us list the factors of the first seven triangle numbers:

 1: 1
 3: 1,3
 6: 1,2,3,6
10: 1,2,5,10
15: 1,3,5,15
21: 1,3,7,21
28: 1,2,4,7,14,28
We can see that 28 is the first triangle number to have over five divisors.

What is the value of the first triangle number to have over five hundred divisors?
=#

include("math_tools.jl")

import math_tools: count_factors

function triangle(n :: Int)
	return div(n*(n+1),2)
end

for n in 2:100000 # count_factors will give error for n == 1 since it is relying on prime factorization.
	t = triangle(n)
	if count_factors(t) > 500
		println(t)
		break
	end
end