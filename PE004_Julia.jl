#=
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=#

include("math_tools.jl")

import math_tools:
    is_palindrome

function find_all_multiples_of_3_digit_sums()
    pali_multiples = map(x -> parse(Int64, x), filter(is_palindrome, Set(string(a*b) for a in 100:999 for b in 100:999)))
    return pali_multiples
end

pali_set = find_all_multiples_of_3_digit_sums()

ans = maximum(pali_set)

println(ans)