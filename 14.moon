-- The following iterative sequence is defined for the set of positive integers:
-- 
-- n → n/2 (n is even)
-- n → 3n + 1 (n is odd)
-- 
-- Using the rule above and starting with 13, we generate the following sequence:
-- 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
-- 
-- It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
-- 
-- Which starting number, under one million, produces the longest chain?
-- 
-- NOTE: Once the chain starts the terms are allowed to go above one million.

seqs = {[1]: {}}

next_term = (n) ->
    if n % 2 == 0
        0.5 * n
    else
        3 * n + 1

part_seq = (start) ->
    s = {start}
    while not seqs[start]
        start = next_term(start)
        s[#s+1] = start
    return s

total_len = (start) ->
    if not seqs[start]
        seqs[start] = part_seq start

    l, s = 0, seqs[start]
    while s
        l += #s
        s = seqs[s[#s]]
    return l

max_i, max_len = 0, 0
for i = 1, 1e6
    if total_len(i) > max_len
        max_i = i
        max_len = total_len(i)
print max_i
