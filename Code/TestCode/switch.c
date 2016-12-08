/*
 * If we assume that this is the kernel and run on the FPGA
 */
int __attribute__((annotate("1000 1 0"))) kernel(
    int __attribute__((annotate("200 100 0"))) x,
    int __attribute__((annotate("900 500 0"))) y)
{
	int z = 0;
    switch (x) {
        case 200:
            z = (x*y) - (x+30);
            break;
        case 124:
            z = (x*x) - (x+123);
        case 432:
            z += 100;
            break;
        default:
            z = 2;
            break;
    }
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
