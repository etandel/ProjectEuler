LIMIT = 1000000  # 1e6


def eratosthenes(n):
    l = [False, False] + [True for i in xrange(1, n+1)]
    for i in xrange(2, n+2):
        for j in xrange(2*i, n+2, i):
            l[j] = False

    return l


def rotations(n):
    digits = [d for d in str(n)]
    for i in xrange(len(digits)):
        digits.insert(len(digits), digits.pop(0))
        yield int(''.join(digits))


def main():
    count = 0
    primes = eratosthenes(LIMIT)
    for i in xrange(2, LIMIT):
        if all(map(lambda n: primes[n], rotations(i))):
            count += 1

    print count


if __name__ == '__main__':
    main()
