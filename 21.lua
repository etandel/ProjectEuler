--[[
Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
--]]

local sqrt = math.sqrt
local function sum_of_divisors(n)
    local sum = 0
    for i = 2, sqrt(n) do
        if n % i == 0 then
            sum = sum + i + n/i
        end
    end
    return sum + 1
end

local computed = {}

local sum = 0
for i = 2, 1e4-1 do
    if not computed[i] then
        amicable = sum_of_divisors(i)
        if i == sum_of_divisors(amicable) then
            computed[i] = amicable
            computed[amicable] = i
            if amicable ~= i then
                sum = sum + i + amicable
            end
        end
    end
end

print(sum)
