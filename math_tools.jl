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

function recursive_powerset(lst :: Array)
    if isempty(lst)
        return [[]]
    else
        recursive_result = recursive_powerset(lst[2:end])
        return [recursive_result; [[[lst[1]]; item] for item in recursive_result]]
    end
end

function powerset_c(lst :: Array)
    output = [[]]
    for item in lst
        output = [output; [[subset; [item]] for subset in output]]
    end
    return output
end

function million_primes()
    # return an array of primes up to 1 million
end

function hundred_million_primes()
    # return an array of primes up to 100 million
end

function squares(n :: Int)
    return [x*x for x in 1:n]
end

function triangles(n :: Int)
    return [div(x*(x+1),2) for x in 1:n]
end

function pentagons(n :: Int)
    return [div(x*(3x-1), 2) for x in 1:n]
end

function hexagons(n)
    return [x*(2x-1) for x in 1:n]
end

function int2bin(n :: Int)
    return bin(n)
end

function concat(xxs)
    return reduce((x,y) -> [x;y], xxs)
end

function check_perm_s(a,b)
    # Check if 2 strings are permutations of each other.
    if sort(a) == sort(b)
        return true
    else
        return false
    end
end

function check_perm_n(a,b)
    # Check if 2 integers are permuations of another.
    tally = zeros(Int, 10)
    while a > 0
        n = a % 10
        tally[n+1] += 1
        a = div(a, 10)
    end
    while b > 0
        n = b % 10
        tally[n+1] -= 1
        b = div(b, 10)
    end
    for i in tally
        if i != 0
            return false
        end
    end
    return true
end

ArrayOrTuple = Union{Array, Tuple} # Type Union

function digits2int(ds :: ArrayOrTuple)
    # Convert an array or tuple of ints into an integer
    n = 0
    k = 1
    i = length(ds)
    while i > 0
        n += k * ds[i]
        k *= 10
        i -= 1
    end
    return n
end

function int2digits(x :: Int)
    # Convert an int to array of digits
    if x == 0
        return Int8[0]
    end
    digits = Int8[]
    while x > 0
        digits = [Int8(x % 10); digits]
        x = div(x, 10)
    end
    return digits
end
