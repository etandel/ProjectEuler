--[[
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
--]]

function new_sum()
    local s = 0
    return function(val)
        if type(val) == 'number' then
            s = s + val
        end
        return s
    end
end

function should_add(val)
    return (val % 3 == 0) or (val % 5 == 0)
end

sum = new_sum()
for i = 1, 999 do
    if should_add(i) then
        sum(i)
    end
end
print(sum())
