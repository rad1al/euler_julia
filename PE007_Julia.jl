#=
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10001st prime number?
=#

function e_sieve(n :: Int)
	lst = trues(n)
	lst[1] = false
	for i in 1:isqrt(length(lst))+1
		if lst[i] == true
			lst[i^2:i:end] = false
		end
	end
	return find(lst)
end

primes = e_sieve(Int64(1e7))

println(primes[10001])

