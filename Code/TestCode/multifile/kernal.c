#include "kernal.h"

int __attribute__((annotate("900 300 0"))) kernal_sum(int __attribute__((annotate("100 0 0"))) x, int __attribute__((annotate("15 -5 0"))) y) {
    int __attribute__((annotate("10 10 10"))) z = 0;
    if (x < 10) {
        z = x * y;
    } else {
        z = x + y;
    }
    return z;
}
