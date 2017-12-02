#include <stdio.h>
#include <stdlib.h>

int n;

void InsertSort(int *array)
{
    int i, j;
    for (i = 2; i <= n; i++)
    {
        if (array[i] < array[i - 1])
        {
            array[0] = array[i];
            array[i] = array[i - 1];
            for (j = i - 2; array[0] < array[j]; j--)
            {
                array[j + 1] = array[j];
            }
            array[j + 1] = array[0];
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
    for (i = 1; i <= n; i++)
    {
        scanf("%d", &array[i]);
    }
    InsertSort(array);
    printf("after sort data:\n");
    for (i = 1; i <= n; i++)
    {
        printf("%d ", array[i]);
    }
    printf("\n");
}
    

