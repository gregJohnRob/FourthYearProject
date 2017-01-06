
int kernal (int __attribute__((annotate("1000 0 0"))) arr[], int __attribute__((annotate("5 0 0"))) size) {
    int   __attribute__((annotate("1000 0 0"))) i;
    int   __attribute__((annotate("1000 0 0"))) total = 0;
    for (i = 0; i < size; i++) {
        total += arr[i];
        // int __attribute__((annotate("1000 0 0"))) hello = otherarr[i];
        // total += hello;
    }
    int   __attribute__((annotate("1000 0 0"))) j;
    for (j = 0; j < size-5; j++) {
        total += arr[j];
    }
    return total;
}


int main() {
    int arr[] = {100, 300, 200, 1, 4};
    // int otherarr[] = {100, 300, 200, 1, 4};
    int temp = kernal(arr, 5);
    return temp;
}
