#include <stdio.h>
#include <stdlib.h>

int n;

void ShellSort(int *array)
{
    int k = n / 2;
    while (k > 0)
    {
        int i, j;
        for (i = k + 1; i <= n; i++)
        {
            if (array[i] < array[i - k])
            {
                array[0] = array[i];
                array[i] = array[i - 1];
                for (j = i - k; j > 0 && array[0] < array[j]; j-=k)
                {
                    array[j + k] = array[j];
                }
                array[j + k] = array[0];
            }
        }
        k = k / 2;
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
    for (i = 1; i <= n; i++)
    {
        scanf("%d", &array[i]);
    }
    ShellSort(array);
    printf("after sort data:\n");
    for (i = 1; i <= n; i++)
    {
        printf("%d ", array[i]);
    }
    printf("\n");
}
    

