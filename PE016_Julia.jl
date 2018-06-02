#=
2**15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 21000?
=#

num_ = BigInt(2)^1000

ans = sum([parse(Int64,x) for x in string(num_)])

println(ans)

# real	0m0.354s
# user	0m0.342s
# sys	0m0.165s