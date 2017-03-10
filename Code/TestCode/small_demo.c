int __attribute((annotate("20 0 0"))) addition(int __attribute((annotate("10 0 0"))) x, int __attribute((annotate("10 0 0"))) y) {
    return x + y;
}

int main() {
    int __attribute((annotate("10 0 0"))) array_x[] = {1,2,3,4,5,6,7,8,9,10};
    int __attribute((annotate("10 0 0"))) array_y[] = {10,9,8,7,6,5,4,3,2,1};
    int array_z[] = {0,0,0,0,0,0,0,0,0,0};
    int __attribute((annotate("10 0 0"))) i;
    for (int i = 0; i < 10; i++) {
        array_z[i] = addition(array_x[i], array_y[i]);
    }
    return 1;
}
