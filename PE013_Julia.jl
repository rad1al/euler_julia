#=
Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.
=#

f = open("data/PE13_data.txt")
s = readstring(f)
close(f)

data = split(s, '\n')
nums = [parse(BigInt,x) for x in data]

s = sum(nums)

ans = string(s)[1:10]

println(ans)

# real	0m0.367s
# user	0m0.385s
# sys	0m0.149s