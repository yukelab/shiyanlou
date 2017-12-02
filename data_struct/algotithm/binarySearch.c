#include <stdio.h>
#include <stdlib.h>

int BinarySearch(int *array, int key, int low, int high)
{
    int mid;
    while (low <= high)
    {
        mid = (low + high) / 2;
        if (key == array[mid])
        {
            return mid;
        }
        else if (key < array[mid])
        {
            high = mid - 1;
        }
        else
        {
            low = mid + 1;
        }
    }
    return 0;
}

int main()
{
    int n, i, key, position;
    int *array;
    printf("please input the size of order array :\n");
    scanf("%d", &n);
    array = (int *) malloc(sizeof(int) *n);

    printf("please input the order array in ascending:\n");
    for (i = 0; i < n; i++)
    {
        scanf("%d", &array[i]);
    }

    printf("please input a numer you want to search:\n");
    scanf("%d", &key);
    if (position = BinarySearch(array, key, 0, n-1))
    {
        printf("%d in location %d\n", key, position);
    }
    else 
    {
        printf("%d not exist\n",key);
    }
}
