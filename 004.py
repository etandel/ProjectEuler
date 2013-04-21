#coding=utf-8
"""
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.

(Should be run with Python 3)
"""

def is_palindrome(m):
    word = str(m)
    return word == word[::-1]

limits = (1, 1000)
max_palindrome = 0
for i in range(*limits):
    for j in range(*limits):
        m = i*j
        if m >= max_palindrome and is_palindrome(m):
            max_palindrome = m
        
print(max_palindrome)
