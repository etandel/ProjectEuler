--[[
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
--]]


local function range_set(begin, end_)
    s = {}
    for i = begin, end_ do
        s[i] = true
    end
    return s, begin - end_ + 1
end

local function eratosthenes(n)
    local primes = range_set(2, n)
    for i = 2, n do
        for j = i*i, n, i do
            primes[j] = nil
        end
    end
    return primes
end

function prime_factors(n)
    candidates = eratosthenes(n)
    factors = {}
    for prime in pairs(candidates) do
        while n % prime == 0 do
            factors[prime] = factors[prime] and factors[prime]+1 or 1
            n = n / prime
        end
        if n <= 1 then
            break
        end
    end
    return factors
end

---------- main -----------

local limit = tonumber(arg[1]) or 20
minimum_amounts = setmetatable({}, {__index = function() return 0 end})
for i = 1, limit do
    factors = prime_factors(i)
    for factor, amount in pairs(factors) do
        if amount > minimum_amounts[factor] then
            minimum_amounts[factor] = amount
        end
    end
end

p = 1
for factor, amount in pairs(minimum_amounts) do
    p = p * factor^amount
end
print(p)
