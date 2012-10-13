--By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
tri0 = [[
3
7 4
2 4 6
8 5 9 3
]]
--
--That is, 3 + 7 + 4 + 9 = 23.
--
--Find the maximum total from top to bottom of the triangle below:
triangle = [[
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
]]
--
--NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. However, Problem 67, is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)

import random, exp from math

math.randomseed os.time!

class Row
    new: (sr_row) =>
        if sr_row
            for i in sr_row\gmatch '%d+'
                self[#self+1] = i

    sum: =>
        s = 0
        s += v for v in *self
        return s


class Tree
    new: (tri) =>
        i = 1
        for r in tri\gmatch '..-\n'
            self[i] = Row r
            i += 1

    print: =>
        for i = 1, #self
            print table.concat self[i], ' '
    
    largest_path: =>
        node = @top.next
        i = 1
        sum = 0
        path = {i}
        while node
            n = node[i]
            sum += n
            i = node\largest_neighbour i
            node = node.next
        return path, sum
    

class SimulatedAnnealing extends Tree
    new: (tri) =>
        @temperature = 1e4
        @rate = 0.99999
        @min_temp = 0.1
        super tri

    random_path: =>
        totalsum = 0
        path = {1}
        for i = 2, #self
            j0 = path[i - 1]
            j = math.random j0, j0+1
            path[i] = j
            totalsum += self[i][j]
        return path, totalsum

    mutate_path: (path) =>
        rand_row = random 2, #path
        if path[rand_row] == path[rand_row - 1] --i == i0
            path[rand_row] += 1 --i == i0 -1
        else
            path[rand_row] -= 1

        if rand_row < #path
            i = rand_row
            diff = path[i+1] - path[i]
            while diff < 0 or diff > 1
                if diff < 0
                    path[i+1] -= diff
                else
                    path[i+1] = path[i+1] - diff + 1
                i += 1
                if i == #self
                    break
                else
                    diff = path[i+1] - path[i]

        newsum = 0
        for i = 1, #self
            v = path[i]
            newsum += self[i][v]

        return path, newsum

    accept_prob: (s0, s) =>
        s < s0 and 1 or exp (s0 - s)/@temperature

--with SimulatedAnnealing triangle
--    \print!
--    print!
--
--    while true
--        path0, sum0 = \random_path!
--        path, sum = \mutate_path path0
--        if sum < sum0
--            io.write j..' ' for j in *path0
--            print sum0
--
--            io.write j..' ' for j in *path0
--            print sum
--            break



with SimulatedAnnealing triangle
    path0, sum0 = \random_path!
    while .temperature >= .min_temp
        path, sum = \mutate_path path0
        if \accept_prob(sum0, sum) <= random!
            path0, sum0 = path, sum
        .temperature *= .rate
    print sum0

