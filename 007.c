/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
*/

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <limits.h>

#define LIMIT 1e6
#define NTH 10001

typedef long long int num_t;

void eratosthenes(char *primes, num_t n){
    num_t i, j;
    memset(primes, 1, n);
    for (i=2; i<n; i++){
        for (j=i*i; j<n; j+=i){
            primes[j] = 0;
        }
    }
}

num_t get_nth_prime(num_t n, char *primes, num_t size){
    num_t i, nth=0, prime_i=0;
    for(i=2; i<size; i++)
        if (primes[i]){
            prime_i++;
            nth = i;
            if (prime_i== n){
                break;
            }
        }
    return prime_i < n? 0 : nth;
}

int main(const int argc, const char *argv[]){
    num_t sieve_limit = LIMIT;
    char *primes = malloc(sieve_limit+1);

    eratosthenes(primes, sieve_limit);
    printf("%lld\n", get_nth_prime(NTH, primes, sieve_limit));
    
    free(primes);
    return 0;
}
