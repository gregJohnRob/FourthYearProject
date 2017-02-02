/*
 * If we assume that this is the kernel and run on the FPGA
 */
int __attribute__((annotate("1079870 48770 0"))) kernel(
    int __attribute__((annotate("1200 100 0"))) x,
    int __attribute__((annotate("900 500 0"))) y)
{
	int z;
	z = (x*y) - (x+30);
	return z;
}


/*
 * This is the main function which will run on the computer
 */
int main()
{
	int x;
	int y;
	int z;
	x = 124;
	y = 523;
	z = kernel(x, y);
	return z;
}
