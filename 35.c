/*
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>


#define LIMIT 1000000  // 1e6
#define MAX_NDIGITS 6


typedef long long int num_t;


char * eratosthenes(num_t n){
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


num_t rotate(char *digits, int ndigits){
    char first;
    int i;

    first = digits[0];
    for (i=0; i<ndigits; i++){
        digits[i] = digits[i+1];
    }
    digits[ndigits - 1] = first;

    return atoll(digits);
}


static int test_all_rots(char * primes, num_t n){
    int r = 1, ntries=0, ndigits;
    char digits[MAX_NDIGITS];

    sprintf(digits, "%lld", n);
    ndigits = strlen(digits);

    for (ntries=0; r && ntries<ndigits; ntries++){
        n = rotate(digits, ndigits);
        r &= primes[n];
    }
    return r;
}


int main(const int argc, const char *argv[]){
    num_t count=0, i;
    char *primes = eratosthenes(LIMIT);

    for (i=2; i<LIMIT; i++)
        if (primes[i] && test_all_rots(primes, i))
            count++;

    printf("%lld\n", count);
    
    free(primes);
    return 0;
}
