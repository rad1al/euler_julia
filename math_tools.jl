function factorize(x :: Int)
	s = Set{Int64}()
	for y in 1:isqrt(x) # isqrt obtains the integer sqrt
		if x % y == 0
			union!(s, (y, div(x,y)))
		end
	end
	return s
end

function prime_factorize(x :: Int)
	lst = Int64[]
	n = 2
	while true
		if x == 1
			return lst
		elseif x % n == 0
			push!(lst, n)
			x = div(x,n)
		else
			n += 1
		end
	end
end

function e_sieve(n :: Int)
	a = trues(n)
	a[1] = false
	for i in 1:n
		if a[i] == true
			j = i * i
			if j > n
				return find(a)
			else
				a[j:i:n] = false
			end
		end
	end
end

function count_items(xs)
	count_dct = Dict{Any, Int}()
	for x in xs
		if !haskey(count_dct, x)
			count_dct[x] = 1
		else 
			count_dct[x] += 1
		end
	end
	return count_dct
end

function product(xs)
	return reduce(*, xs)
end

function count_factors(x :: Int)
	pf = prime_factorize(x)
	count_dct = count_items(pf)
	s = product(k+1 for k in values(count_dct))
end

function is_palindrome(word)
	if length(word) < 2
		return true
	elseif word[1] == word[end]
		return true && is_palindrome(word[2:end-1])
	else
		return false
	end
end

function recursive_powerset(lst)
	if isempty(lst)
		return [[]]
	else
		recursive_result = recursive_powerset(lst[2:end])
		return [recursive_result; [[[lst[1]]; item] for item in recursive_result]]
	end
end













