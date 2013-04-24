""" An irrational decimal fraction is created by concatenating the positive integers:

0.123456789101112131415161718192021...

It can be seen that the 12th digit of the fractional part is 1.

If dn represents the nth digit of the fractional part, find the value of the following expression.

d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
"""


MAX = 1000000


def main():
    frac = []
    l = 0
    i = 1
    while l < MAX:
        frac.append(i)
        l += len(str(i))
        i += 1

    fracdigits = ''.join(map(str, frac))

    thenum = 1
    for i in xrange(0, 6+1):
        thenum *= int(fracdigits[10**i - 1])  # index fucking starts with 0

    print(thenum)


if __name__ == '__main__':
    main()
