-- The prime 41, can be written as the sum of six consecutive primes:
-- 41 = 2 + 3 + 5 + 7 + 11 + 13
-- 
-- This is the longest sum of consecutive primes that adds to a prime below one-hundred.
-- 
-- The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
-- 
-- Which prime, below one-million, can be written as the sum of the most consecutive primes?

eratosthenes = (n) ->
    primes = [true for i = 1, n]
    primes[1] = nil

    for i = 2, n
        for j = i*i, n, i
            primes[j] = nil
    return primes


LIMIT = 1e6 --1e6

primes = eratosthenes LIMIT

prime_vec = [i for i in pairs primes]
table.sort prime_vec

theprime = nil
max_count = 0
for start = 1, #prime_vec
    s = 0
    largest = nil
    count = 0
    for i = start, #prime_vec
        count += 1
        s += prime_vec[i]
        if s >= LIMIT
            break
        elseif primes[s] and count > max_count
            max_count = count
            theprime = s

print theprime
