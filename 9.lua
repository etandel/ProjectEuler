--[[
(should be run with lua5.2 compatible interpreter)
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a2 + b2 = c2

For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
--]]

local sum = 1000
local prod
for c = sum, 1, -1 do
    for b = 2, sum-c do
            for a = 1, sum-c-b do
            if a*a + b*b == c*c and a+b+c == sum then
                prod = a*b*c
                goto done
            end
        end
    end
end
::done::
print(prod)

