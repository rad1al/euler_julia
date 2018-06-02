#=
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
=#

squares = Dict{Int64, Int64}(c^2 => c for c in 1:1000)

function search(squares)
	for a in 1:1000
		for b in 1:1000-a
			c2 = a^2 + b^2
			if haskey(squares, c2)
				if a + b + squares[c2] == 1000
					return (a, b, squares[c2])
				end
			end
		end
	end
end

results = search(squares)

println(results[1] * results[2] * results[3])