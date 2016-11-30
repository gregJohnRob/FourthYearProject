
int kernal (int arr[], int __attribute__((annotate("5 0 0"))) size) {
    int i = 0;
    int total = 0;
    while (i < size) {
        int __attribute__((annotate("1000 0 0"))) temp = arr[i];
        total += temp;
        i++;
    }
    return total;
}


int main() {
    int arr[] = {100, 300, 200, 1, 4};
    int temp = kernal(arr, 5);
    return temp;
}
