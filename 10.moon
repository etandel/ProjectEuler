--The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
--
--Find the sum of all the primes below two million.

eratosthenes = (n) ->
    primes = {}
    for i = 2, n
        primes[i] = true

    for i = 2, n
        for j = i*i, n, i
            primes[j] = nil
    return primes

limit = arg[1] or 2e6
s = 0
for prime in pairs eratosthenes limit
    s += prime
print s
