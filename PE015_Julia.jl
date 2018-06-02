#=
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?
=#

function pascal(lst :: Array{Int64, 1})
	tempa = [lst; Int64[0]]
	tempb = [Int64[0]; lst]
	return [tempa[i] + tempb[i] for i in 1:length(tempa)]
end

results = []
row = [1]

for i in 0:40
	push!(results, row)
	row = pascal(row)
end

println(results[41][ceil(Int64, 41/2)])

# real	0m0.377s
# user	0m0.364s
# sys	0m0.176s