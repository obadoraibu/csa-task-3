#include <stdio.h>
#include <math.h>

double logic(double accuracy) {
    double remember;
    double denominator = 0;
    double res = 2;

    do {
        remember = res;
        denominator = sqrt(2 + denominator);
        res *= 2 / denominator;
    } while(fabs(remember - res) > accuracy);
    
    return res;
}