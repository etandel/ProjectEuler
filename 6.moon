--The sum of the squares of the first ten natural numbers is,
--12 + 22 + ... + 102 = 385
--
--The square of the sum of the first ten natural numbers is,
--(1 + 2 + ... + 10)2 = 552 = 3025
--
--Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
--
--Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

map = (seq, func) ->
    return for i = 1, #seq
        func i

reduce = (seq, func, initial) ->
    r, begin_i = if initial
        initial, 1
    else
        seq[1], 2

    for i = begin_i, #seq
        r = func r, seq[i]
    return r

limit = arg[1] or 100
first_100 = for i = 1, limit do i

sum_of_squares =  reduce(map(first_100, (x)->x*x), (r,v)->r + v)
square_of_sum = reduce(first_100, (r,v)->r+v)^2
print square_of_sum - sum_of_squares
