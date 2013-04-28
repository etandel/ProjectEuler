--[[
The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
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


local function remove_left(n)
    return tonumber(tostring(n):sub(2))
end


local function remove_right(n)
    return tonumber(tostring(n):sub(1, -2))
end

local function is_trunc(n, primes)
    local check = true
    local lefty = n
    local righty = n
    while check and lefty and righty do
        check = primes[lefty] and primes[righty]
        lefty = remove_left(lefty)
        righty = remove_right(righty)
    end
    return check
end

---------- main -----------

local function main()
    primes = eratosthenes(1e6)

    local sum = 0
    local count = 0
    local n = 11
    repeat
        if is_trunc(n, primes) then
            count = count + 1
            sum = sum + n
        end
        n = n + 1
    until count == 11

    print(sum)
end

main()
