"""The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 11 + 22 + 33 + ... + 1000^1000.
"""


LIMIT = 1000


def main():
    s = 0
    for i in xrange(1, LIMIT):
        s += i**i
    print str(s)[-10:]


if __name__ == '__main__':
    main()
