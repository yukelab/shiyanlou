#include <stdio.h>
int find_max_set(int *a, int length)
{
	int sum=0, last_sum =0;
	int i, j, k, n;
	for (i = 1; i <= length; i++) // the sum of i elements 
	{
		for (j = 0; j < length; j++) // the first element location
		{
			n = i + j;
			if (n < length)
			{
				sum = 0;
				for (k = j; k <= n; k++) // n element sum 
				{
					sum += a[k];
				}
//				printf("elements sum cnt:%d , the first element location is:%d, sum: %d, n: %d\n", i, j, sum,n);
				if (last_sum < sum)
				{
					last_sum = sum;
				}
			}
			else
			{
				break;
			}
		}
	}
	return last_sum;
}

int main()
{
	int a[] = {-2, 11, -4, 13,-5, 2, -5,-3, 12,-9};
	int b[] = {0,-3,6,8,-20,21,8,-9,10,-1,3,6,5};
	int length = sizeof(a)/sizeof(int);
	int sum;
	sum = find_max_set(a, length);
	printf("sum = %d\n", sum);

	length = sizeof(b)/sizeof(int);
	sum = find_max_set(b, length);
	printf("sum = %d\n", sum);
}

