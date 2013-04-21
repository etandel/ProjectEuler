# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
# 
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
# 
# (Please note that the palindromic number, in either base, may not include leading zeros.)

LIMIT = 10**6


def is_palindrome(s):
    return s == s[::-1]


def main():
    s = 0
    for i in xrange(1, LIMIT):
        if is_palindrome(str(i)) and is_palindrome(bin(i)[2:]):
            s += i
    print s


if __name__ == '__main__':
    main()
