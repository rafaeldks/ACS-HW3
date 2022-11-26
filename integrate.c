double integrate(double a, double b, int left, int right) {
    double result = 0, l = left;
    while (l < right) {
        result += 0.000001 * (2 * a + b * (l * l * l + (l + 0.000001) * (l + 0.000001) * (l + 0.000001))) / 2;
        l += 0.000001;
    }
    return result;
}