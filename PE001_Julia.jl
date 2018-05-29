ans = sum(filter(a -> a % 3 == 0 || a % 5 == 0, (x for x in 1:999)))

println(ans)