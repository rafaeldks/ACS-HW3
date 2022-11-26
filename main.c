#include <stdio.h>

extern void read(double *a, double *b, int *left, int *right);

extern double integrate(double a, double b, int left, int right);

int main() {
    double a, b;
    int left, right;
    read(&a, &b, &left, &right);
    printf("%lf", integrate(a, b, left, right));
    return 0;
}
