int __attribute__((annotate("function_f 10 10 10"))) f(int x, int y) {
	int __attribute__((annotate("Hey sexy"))) z;
	z = (x*y) - (x+30);
	return z;
}


int main() {
	int __attribute__((annotate("hey"))) x;
	int __attribute__((annotate("hello"))) y;
	int z;
	x = 124;
	y = 523;
	z = f(x, y);
	return z;
}
