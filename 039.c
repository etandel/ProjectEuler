/*
If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p ≤ 1000, is the number of solutions maximised?
*/

#include <stdio.h>
#include <math.h>

#define P 1000

static int n_sols(int p){
    int b, c;
    double a;
    int nfound = 0;
    for (b=1; b<p; b++)
        for (c=1; c<p; c++){
            a = sqrt(b*b + c*c);
            if (floor(a) == (double)a && (int)a + b + c == p){
                nfound++;
            }
        }
    return nfound/2;
}

int main (void){
    int p, bestp=0, max_sols_found=0;
    for (p=1, max_sols_found=0; p<=P; p++){
        int nsols = n_sols(p);
        if (nsols > max_sols_found){
            max_sols_found = nsols;
            bestp = p;
        }
    }
        
    printf("%d\n", bestp);
    return 0;
}
