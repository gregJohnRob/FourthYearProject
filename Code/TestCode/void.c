void kernal (int __attribute__((annotate("1000 0 0"))) arr[], int __attribute__((annotate("5 0 0"))) size) {
    int total = arr[0] + arr[1];
    return;
}


int main() {
    int __attribute__((annotate("1000 0 0"))) arr[] = {100, 300, 200, 1, 4};
    // int otherarr[] = {100, 300, 200, 1, 4};
    kernal(arr, 5);
    return 5;
}
