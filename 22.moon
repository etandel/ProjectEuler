-- Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
-- 
-- For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
-- 
-- What is the total of all the name scores in the file?
FIRST_CHAR = string.byte 'A'

charsum = (s) ->
    sum = 0
    sum += (c\byte! - FIRST_CHAR + 1) for c in s\gmatch('.')
    return sum

file = io.open 'data/22.txt', 'r'
data = [name for name in file\read('*a')\gmatch '"(%w+)"']
file\close!

table.sort data

sum = 0
for i = 1, #data
    sum += i * charsum data[i]
print sum

