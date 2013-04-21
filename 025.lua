--[[

The Fibonacci sequence is defined by the recurrence relation:

    Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.

Hence the first 12 terms will be:

    F1 = 1
    F2 = 1
    F3 = 2
    F4 = 3
    F5 = 5
    F6 = 8
    F7 = 13
    F8 = 21
    F9 = 34
    F10 = 55
    F11 = 89
    F12 = 144

The 12th term, F12, is the first term to contain three digits.

What is the first term in the Fibonacci sequence to contain 1000 digits?

---
Uses LHF's lbn library [1].
[1] http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/#lbn
--]]

local bn = require 'bn'

local big1 = bn.number(1)
local fib = setmetatable({big1, big1}, {
        __index = function (self, pos)
            self[pos] = bn.add(self[pos - 1], self[pos - 2])
            return self[pos]
        end
    }
)

local i = 0
local limit = bn.number(10):pow(999) -- first num with 2 digits is 10^1, 3 is 10^2 etc.
repeat
    i = i + 1
until fib[i] >= limit

print(i)
