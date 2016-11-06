int __attribute__((annotate("Hey \n"))) y;
int __attribute__((annotate("Hello\n"))) z;

int f(int x) {
	int __attribute__((annotate("annotation inside of f"))) a;
	return x;
}

int main() {
	int __attribute__((annotate("annotations inside of main"))) x = 0;
	return x;
}
