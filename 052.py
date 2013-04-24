"""It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.

Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.
"""


FACTORS = xrange(2, 6+1)


def main():
    i = 0
    found = False
    while not found:
        i += 1
        digitset = set(str(i))

        multiples = (i*j for j in FACTORS)
        sets = (set(str(m)) for m in multiples)
        if all(s == digitset for s in sets):
            found = True
    print(i)


if __name__ == '__main__':
    main()
