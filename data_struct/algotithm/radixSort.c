#include <stdio.h>
#include <stdlib.h>

int n;
int bit_num;

int GetNumPos(int num, int pos)
{
    int i, temp = 1;
    for (i = 0; i < pos - 1; i++)
    {
        temp *= 10;
    }

    return (num / temp) % 10;
}

void RadixSort(int *array)
{
    int radix = 10;
    int *count, *bucker, i, j, k;

    count = (int *) malloc(sizeof(int) * radix);
    bucker = (int *) malloc(sizeof(int) * n);
    for (k = 1; k <= bit_num; k++)
    {
        for (i = 0; i < radix; i++)
        {
            count[i] = 0;
        }

        for (i = 0; i < n; i++)
        {
            count[GetNumPos(array[i], k)]++;
        }

        for (i = 1; i < radix; i++)
        {
            count[i] = count[i] + count[i - 1];
        }

        for (i = n - 1; i >= 0; i--)
        {
            j = GetNumPos(array[i], k);
            bucker[count[j] - 1] = array[i];
            count[j]--;
        }

        for (i = 0, j = 0; i < n; i++, j++)
        {
            array[i] = bucker[j];
        }
    }
}


int main()
{
    int i;
    int *array;
    printf("please input the number of digits in the maxmun number:\n");
    scanf("%d", &bit_num);
    printf("please input the size of the array:\n");
    scanf("%d", &n);
    array = (int *) malloc(sizeof(int) * (n + 1));

    printf("please input data (delimiter with space)\n");
    for (i = 0; i < n; i++)
    {
        scanf("%d", &array[i]);
    }
    RadixSort(array);
    printf("after sort data:\n");
    for (i = 0; i < n; i++)
    {
        printf("%d ", array[i]);
    }
    printf("\n");
}
