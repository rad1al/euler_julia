#=
The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
=#

# Memoized implementation

lookup = Dict{Int64, Array{Int64,1}}()

function collatz(path :: Array{Int64,1})
	last_ = path[end]
	if last_ == 1
		lookup[path[1]] = path
		return path
	elseif last_ % 2 == 0
		nxt = div(last_, 2)
	else
		nxt = 3 * last_ + 1
	end
	if haskey(lookup, nxt)
		return collatz([path; lookup[nxt]])
	else
		push!(path, nxt)
	end
	return collatz(path)
end

function f(n :: Int64)
	max_chain = Int64[1]
	for i in 1:n
		chain = collatz(Int64[i])
		if length(chain) > length(max_chain)
			max_chain = chain
		end
	end
	return max_chain[1]
end

println(f(1000000))

# real	0m3.010s
# user	0m2.419s
# sys	0m0.770s