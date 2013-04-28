--[[
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?
--]]


local function map(t, f)
    local newt = {}
    f = f or function(...) return ... end
    for i = 1, #t do
        newt[i] = f(t[i])
    end
    return newt
end


local function permutations(word)
    if #word <= 1 then
        return {word}
    end

    -- get all permutations of length N-1
    local perms = permutations(word:sub(2))
    local char = word:sub(1,1)
    local result = {}
    -- iterate over all permutations of length N-1
    for _, perm in ipairs(perms) do
        -- insert the character into every possible location
        for i = 0, #perm do
            result[#result + 1] = perm:sub(1, i) .. char .. perm:sub(i+1)
        end
    end
    return result
end


local function isprime(n)
    for i = 2, math.floor(math.sqrt(n)) do
        if n % i == 0 then
            return false
        end
    end
    return true
end


local function range(n)
    local t = {}
    for i = 1, n do
        t[#t+1] = i
    end
    return t
end


local function main()
    local thenumber = 0
    for n = 9, 1, -1 do
        local allpandigit = {}
        local base = table.concat(range(n))

        allpandigit = map(permutations(base), tonumber)
        for _, pandigit in ipairs(allpandigit) do
            if pandigit > thenumber and isprime(pandigit) then
                thenumber = pandigit
            end
        end

        if thenumber > 0 then
            break
        end
    end

    print(thenumber)
end


main()
