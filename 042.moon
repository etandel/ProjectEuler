-- The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1);
-- so the first ten triangle numbers are:
-- 
-- 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
-- 
-- By converting each letter in a word to a number corresponding to its
-- alphabetical position and adding these values we form a word value. For
-- example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value
-- is a triangle number then we shall call the word a triangle word.
-- 
-- Using words.txt (right click and 'Save Link/Target As...'), a 16K text file
-- containing nearly two-thousand common English words, how many are triangle words?


is_triangle = (t) ->
    n = (-1 + math.sqrt(1 + 8 * t)) / 2
    return n == math.floor n


words_f = io.open 'data/42.txt'

count = 0
for word in words_f\read('*a')\gmatch('[A-Z]+')
    word_value = 0
    for l in word\gmatch '.'
        word_value += l\byte! - string.byte('A') + 1

    if is_triangle word_value
        count += 1
print count

words_f\close!
