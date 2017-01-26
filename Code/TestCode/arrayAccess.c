
int __attribute__((annotate("123 12 312"))) kernal (int __attribute__((annotate("1000 0 0"))) arr[], int __attribute__((annotate("5 0 0"))) size) {
    int total = arr[0] + arr[1];
    return total;
}


int main() {
    int __attribute__((annotate("1000 0 0"))) arr[] = {100, 300, 200, 1, 4};
    // int otherarr[] = {100, 300, 200, 1, 4};
    int temp = kernal(arr, 5);
    return temp;
}
