/*
You are given the following information, but you may prefer to do some research for yourself.

    1 Jan 1900 was a Monday.
    Thirty days has September,
    April, June and November.
    All the rest have thirty-one,
    Saving February alone,
    Which has twenty-eight, rain or shine.
    And on leap years, twenty-nine.
    A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
---
This algorithm is based on the weekday calculator by Tomohiko Sakamoto [1].
[1] http://en.wikipedia.org/wiki/Calculating_the_day_of_the_week#Implementation-dependent_methods_of_Sakamoto.2C_Lachman.2C_Keith_and_Craver
 */

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <limits.h>

#define SUNDAY 0

int weekday(int y, int m, int d){
   static int t[] = {0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4};
   y -= m < 3;
   return (y + y/4 - y/100 + y/400 + t[m-1] + d) % 7;
}

int main(const int argc, const char *argv[]){
    int y, m, result=0;
    for (y=1901; y<=2000; y++)
        for (m=1; m<=12; m++)
            if (weekday(y,m,1) == SUNDAY)
                result++;

    printf("%d\n", result);
    return 0;
}
