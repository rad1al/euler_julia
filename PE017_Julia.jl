#=
"""
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
"""
=#

include("math_tools.jl")

import math_tools: int2digits

ones_ = ["one","two","three","four","five","six","seven","eight",
     "nine","ten","eleven","twelve","thirteen","fourteen","fifteen",
     "sixteen","seventeen","eighteen", "nineteen"]
tys = ["twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety"]

function first_digit(x)
	return int2digits(x)[1]
end

function decompose(x)
	if x == 0
		return ""
	elseif x < 20
		return ones_[x]
	elseif 20 <= x < 100
		return tys[first_digit(x) - 1] * decompose(x - first_digit(x) * 10)
	elseif x < 1000 && x % 100 == 0
		return ones_[first_digit(x)] * "hundred"
	elseif 100 < x <= 999
		return ones_[first_digit(x)] * "hundredand" * decompose(x-first_digit(x)*100)
	elseif x == 1000
		return "onethousand"
	end
end

function test_decompose()
	@assert decompose(0) == ""
	@assert decompose(17) == "seventeen"
	@assert decompose(293) == "twohundredandninetythree"
	@assert decompose(300) == "threehundred"
	@assert decompose(999) == "ninehundredandninetynine"
	@assert decompose(1000) == "onethousand"
	println("All tests passed.")
end

# test_decompose()

number_names = map(decompose, [x for x in 1:1000])
ans = sum(map(length, number_names))

println(ans)

# real	0m0.758s
# user	0m0.815s
# sys	0m0.136