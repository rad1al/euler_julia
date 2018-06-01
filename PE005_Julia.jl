#=
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
=#

include("math_tools.jl")

import math_tools:
	product

function elim_factors(lst :: Array)
	for i in 1:length(lst)
		for j in i+1:length(lst)
			if lst[j] % lst[i] == 0
				lst[j] = div(lst[j], lst[i])
			end
		end
	end
	return lst
end

function get_answer(n)
	lst = Array{Int64}(1:n)
	factors = elim_factors(lst)
	return product(factors)
end

println(get_answer(20))