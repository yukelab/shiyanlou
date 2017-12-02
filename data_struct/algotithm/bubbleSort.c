#include <stdio.h>
#include <stdlib.h>

int n;

void BubbleSort(int *array)
{
    int i, j, temp;
    for (i = 0; i < n - 1; i++)
    {
        for (j = 0;j < n-1-i; j++)
        {
            if (array[j] > array[j + 1])
            {
                temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
            }
        }
    }
}

int main()
{
    int i;
    int *array;
    printf("please input the size of the array:\n");

    scanf("%d", &n);
    array = (int *) malloc(sizeof(int) * (n + 1));

    printf("please input data (delimiter with space)\n");
    for (i = 0; i < n; i++)
    {
        scanf("%d", &array[i]);
    }
    BubbleSort(array);
    printf("after sort data:\n");
    for (i = 0; i < n; i++)
    {
        printf("%d ", array[i]);
    }
    printf("\n");
}
