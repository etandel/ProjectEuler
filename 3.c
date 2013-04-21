/*
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
 */

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <limits.h>

#define LIMIT 600851475143

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

void printall(char *primes, num_t n){
    num_t i;
    for (i=0; i<n; i++)
        printf("%lld: %d\n", i, primes[i]);
}

num_t largest_prime_factor(num_t composite, char *primes, num_t n){
    num_t i;
    for(i=n; i>0; i--)
        if (primes[i] && composite % i == 0)
            break;
    return i;
}

int main(const int argc, const char *argv[]){
    num_t sieve_limit = ceil(sqrt(LIMIT));
    char *primes = malloc(sieve_limit+1);

    eratosthenes(primes, sieve_limit);
    //printall(primes, sieve_limit);
    printf("%lld\n", largest_prime_factor(LIMIT, primes, sieve_limit));
    
    free(primes);
    return 0;
}
