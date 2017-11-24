#include <stdlib.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
	FILE *fp1, *fp2;
    char ch;
    printf ("input argv[1]:%s", argv[1]);
    printf ("input argv[2]:%s", argv[2]);
	if ((fp1 = fopen(argv[1],"r"))==NULL)
	{
		printf("error, copy origin file is  not exist!");
		exit(0);
	}
	
	if ((fp2 = fopen(argv[2],"r"))==NULL)
	{
		printf("error, copy dest file is exist!");
		exit(0);
	}
	fp2= fopen(argv[2],"w");
    while((ch = fgetc(fp1)) != EOF)
    {
        fputc(ch, fp2);
    }

	fclose(fp1);
	fclose(fp2);
	return 0;
}
