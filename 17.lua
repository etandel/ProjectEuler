--[[
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
--]]

local meta_1 = {
    __index = function(self, k)
        if type(k) == 'string' then
            k = tonumber(k)
        end
        if rawget(self, k) then
            return self[k]
        else
            return nil
        end
    end
}

local ones = {
    [0] = '',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'ten',
    'eleven',
    'twelve',
    'thirteen',
    'fourteen',
    'fifteen',
    'sixteen',
    'seventeen',
    'eighteen',
    'nineteen',
}

local tens = {
    [2] = 'twenty',
    [3] = 'thirty',
    [4] = 'forty',
    [5] = 'fifty',
    [6] = 'sixty',
    [7] = 'seventy',
    [8] = 'eighty',
    [9] = 'ninety',
}

setmetatable(ones, meta_1)
setmetatable(tens, meta_1)

local hundreds = setmetatable({}, {
    __index = function(self, k)
        return ones[k] .. ' hundred'
    end
})

local function form_name(n)
    local str_n = tostring(n)
    if #str_n > 3 then
        return ''
    end

    local digits = {}
    for i = 3,1,-1 do
        digits[i] = str_n:sub(-i, -i)
    end
    words = {}
    first_2 = digits[2] .. digits[1]

    if digits[3] ~= '' then
        words[#words+1] = hundreds[digits[3]]
        if first_2 ~= '00' then
            words[#words+1] = 'and'
        end
    end

    if #str_n > 1 and ones[first_2] then
        words[#words+1] = ones[first_2]
    else
        one, two = ones[digits[1]], tens[digits[2]]
        words[#words+1] = two or ''
        words[#words+1] = one or ''
    end
    return table.concat(words, ' ')
end

local function normalize(s)
    return s:gsub('[%s%-]', '')
end

local sum = 0
for i = 1, 999 do
    sum = sum + #normalize(form_name(i))
end
sum = sum + #('onethousand')
print(sum)
