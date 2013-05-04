/*
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?
*/

#include <stdlib.h>
#include <stdio.h>
#include <math.h>


static double nperms_with_rep(double total, double reps[], int nreps){
    int i;
    double v = lgamma(total + 1);
    for (i=0; i<nreps; i++)
        v -= lgamma(reps[i] + 1);
    return exp(v);
}

int main(void){
    double reps[] = {20.0, 20.0};
    double v = nperms_with_rep(40, reps, 2);
    printf("%lf\n%lf\n%lf\n", v, floor(v), ceil(v)); 
    return 0;
}
