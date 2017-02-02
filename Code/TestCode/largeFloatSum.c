/*
 * If we assume that this is the kernel and run on the FPGA
 */
float __attribute__((annotate("1000 1 0"))) kernel(
    float __attribute__((annotate("200 100 4"))) x,
    float __attribute__((annotate("900 500 5"))) y)
{
	float z;
	z = (x*y) - (x+30);
	return z;
}


/*
 * This is the main function which will run on the computer
 */
int main()
{
	float x;
	float y;
	float z;
	x = 124;
	y = 523;
	z = kernel(x, y);
	return 72;
}
