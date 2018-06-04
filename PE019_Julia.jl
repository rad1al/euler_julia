#=
1 Jan 1900 was a Monday.
Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.
A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
=#

# I wanted to see if I could reimplement my Haskell solution in Julia... 

include("math_tools.jl")

import math_tools: concat

function hundred_years()
	return [repmat([1,0,0,0],25); [0]][2:end] # analogous to ([1,0,0,0]*25 + [0])[2:] in python
end

function week_pattern()
	return repmat([(2,),(3,),(4,),(5,),(6,),(7,),(1,)], 52*101)
end

function convert_bin_to_days(n)
	if n == 1
		return 366
	elseif n == 0
		return 365
	else
		return false
	end
end

function convert_bin_to_months_and_days(b)
	return [(x,y) for x in 1:12 for y in 1:convert_months_to_days(x,b)]
end

function convert_months_to_days(n,b)
	if n == 1 return 31
	elseif n == 2 && b == 1 return 29
	elseif n == 2 && b == 0 return 28
	elseif n == 3 return 31
	elseif n == 4 return 30
	elseif n == 5 return 31
	elseif n == 6 return 30
	elseif n == 7 return 31
	elseif n == 8 return 31
	elseif n == 9 return 30
	elseif n == 10 return 31
	elseif n == 11 return 30
	elseif n == 12 return 31
	else return false
	end
end

function calendar()
	return map(convert_bin_to_months_and_days, hundred_years())
end

function monday_check(xs)
	if xs[1] == 7 && xs[end] == 1
		return true
	else
		return false
	end
end


@inline function join_tuples(ts)
	return reduce((a,b) -> (a..., b...), ts)
end

# Courtesy of Michael Eastwood @ https://discourse.julialang.org/t/efficient-tuple-concatenation/5398

@inline tuplejoin(x) = x
@inline tuplejoin(x, y) = (x..., y...)
@inline tuplejoin(x, y, z...) = tuplejoin(tuplejoin(x, y), z...)

c = concat(calendar())
w = week_pattern()
# calendar_with_days = map(concat, zip(w,c))
# calendar_with_days = map(x -> tuplejoin(x...), take(zip(w,c), length(c)))
calendar_with_days = map(join_tuples, take(zip(w,c), length(c)))
println(length(filter(monday_check, calendar_with_days)))
