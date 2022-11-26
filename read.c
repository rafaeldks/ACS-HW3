#include <stdio.h>
#include <stdlib.h>

void read(double *a, double *b, int *left, int *right) {
    printf("Введите числа a и b: ");
    scanf("%lf", a);
    scanf("%lf", b);
    if (*a < -100 || *a > 100 || *b < -100 || *b > 100) {
        printf("Числа a и b должны быть в диапазоне [-100;100]");
        exit(1);
    }
    printf("Введите левую и правую границы интегрирования: ");
    scanf("%d", left);
    scanf("%d", right);
    if (*left < -100 || *left > 100 || *right < -100 || *right > 100) {
        printf("Границы должны быть в диапазоне [-100;100]");
        exit(1);
    }
    if (*left > *right) {
        printf("Левая граница должна быть не больше правой");
        exit(1);
    }
}