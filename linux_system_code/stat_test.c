#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

#define FILE_PATH "./test.txt"

int main(int argc, char **argv)
{
    struct stat buf;
    if (argc != 2)
    {
	printf("Usage: stat<pathname>");
	exit(-1);
    }

    if (stat(argv[1], &buf) != 0)
    {
	printf("stat error/");
	exit(-1);
    }

    printf("#i-node : %ld\n", buf.st_ino);
    printf("#link: %d\n", buf.st_nlink);
    printf("#UID: %d\n", buf.st_uid);
    printf("#GID: %d\n", buf.st_gid);
    printf("#Size: %d\n", buf.st_size);
    return 0;
}
