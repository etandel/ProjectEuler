/*
Euler published the remarkable quadratic formula:

n² + n + 41

It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.

Using computers, the incredible formula  n² − 79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, −79 and 1601, is −126479.

Considering quadratics of the form:

    n² + an + b, where |a| < 1000 and |b| < 1000

    where |n| is the modulus/absolute value of n
    e.g. |11| = 11 and |−4| = 4

Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.
*/

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <limits.h>


#define PRIME_LIMIT 1e6
#define COEF_LIMIT 1e3


typedef long long int num_t;


char * erastosthenes(num_t n){
    num_t i, j;
    char *primes = malloc(n + 1);

    memset(primes, 1, n);
    for (i=2; i<n; i++){
        for (j=i*i; j<n; j+=i){
            primes[j] = 0;
        }
    }
    return primes;
}


num_t count_consecutive(char * primes, num_t a, num_t b){
    num_t n=0, count=0;
    while (1){
        num_t v = n*n + a*n + b;
        if (v > 0 && primes[v]){
            count++;
            n++;
        }
        else
            break;
    }
    return count;
}


int main(const int argc, const char *argv[]){
    num_t a, b, nconsec,
        max_a=-COEF_LIMIT, max_b=-COEF_LIMIT, max_consec=0;
    char *primes = erastosthenes(PRIME_LIMIT);

    for (a=-COEF_LIMIT; a<COEF_LIMIT; a++)
        for (b=-COEF_LIMIT; b<COEF_LIMIT; b++){
            nconsec = count_consecutive(primes, a, b);
            if (nconsec > max_consec) {
                max_consec = nconsec;
                max_a = a;
                max_b = b;
            }
        }

    printf("%lld\n", max_a*max_b);
    
    free(primes);
    return 0;
}
