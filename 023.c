/*
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <limits.h>

#define LIMIT 28123
#define AB_LIMIT 28123 //14061 //floor(28123/2)

#define print_iss(v, i) (printf("%d %d\n", (i), (v)[(i)-1]))

int is_abundant(int n){
    int i, s=1;
    double l = sqrt(n);

    for (i=2; i<=l; i++)
        if (n%i == 0)
            s += i + n/i;
    //
    //if number is a square number, then its square root was counted twice
    if (fmod(n, sqrt(n)) == 0.0)
        s -= l;

    return s > n;
}

int main(void){
    int sum_of_abundants[LIMIT];
    int abundants[AB_LIMIT];
    int i,j;
    long int sum;

    //find all abundants
    memset(abundants, 0, AB_LIMIT*sizeof(int));
    for (i=0; i<AB_LIMIT; i++)
        if (!abundants[i] && is_abundant(i+1))
            for (j=i+1; j-1<AB_LIMIT; j+=i+1) //multiples of abundant are also abundant
                abundants[j-1] = 1;

    //find all sums of abundants
    memset(sum_of_abundants, 0, LIMIT*sizeof(int));
    for (i=0; i<AB_LIMIT; i++)
        if (abundants[i])
            for (j=i; j<AB_LIMIT; j++)
                if (abundants[j])
                    sum_of_abundants[i+j+1] = 1; //i+1 + j+1 -1

    // sum deficient and perfect numbers
    sum = 0;
    for (i=0; i<LIMIT; i++){
        if (!sum_of_abundants[i])
            sum += i+1;
    }
    printf("%ld\n", sum);

    return 0;
}
