#include <stdio.h>

int main()
{
    int endLineNum = 0;
    int i = 0;
    int n = 0;
    int starNum = 0;
    int s = 0;
    int e = 0;
    printf ("Please input a end line number:");
    scanf("%d", &endLineNum);
    starNum = 2 * endLineNum - 1;
    for(i = 0; i < starNum; i++)
    {
        if (i < endLineNum)
        {
            s = endLineNum - i - 1;
            e = endLineNum + i - 1;        
        }
        else
        {
            s =  s + 1;
            e =  e - 1;        
        }
//        printf("s=%d;e=%d",s,e);
        for(n = 0; n < starNum; n++)
        {
            if (n < s)
            {
                printf(" ");
            }
            else if (n > e)
            {
                printf(" ");
            }
            else
            {
                printf("*");
            }
        }
        printf("\n");
    }
}
