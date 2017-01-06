
int kernal (int __attribute__((annotate("1000 0 0"))) arr[], int __attribute__((annotate("5 0 0"))) size) {
    int __attribute__((annotate("1000 0 0"))) i = 0;
    int __attribute__((annotate("1000 0 0"))) total = 0;
    while (i < size) {
        int __attribute__((annotate("1000 0 0"))) temp = arr[i];
        total += temp;
        i++;
    }
    return total;
}


int main() {
    int __attribute__((annotate("1000 0 0"))) arr[] = {100, 300, 200, 1, 4};
    int __attribute__((annotate("1000 0 0"))) temp = kernal(arr, 5);
    return temp;
}
