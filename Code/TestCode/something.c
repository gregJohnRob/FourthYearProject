int __attribute__((annotate("y 20 5 0"))) y;
int __attribute__((annotate("z 12 0 0"))) z;

int f(int x) {
	int __attribute__((annotate("a 15 4 0"))) a;
	return x;
}

int main() {
	int __attribute__((annotate("x 0 39 0"))) x = 0;
	return x;
}
