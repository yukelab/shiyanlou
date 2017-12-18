#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>


int main(int argc, char **argv)
{
    struct stat buf;
    char * file_mode;
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

    if (S_ISREG(buf.st_mode))
	file_mode = "-";
    else if (S_ISDIR(buf.st_mode))
	file_mode = "d";
    else if (S_ISCHR(buf.st_mode))
	file_mode = "c";
    else if (S_ISBLK(buf.st_mode))
	file_mode = "b";

    printf("#i-node : %ld\n", buf.st_ino);
    printf("#link: %d\n", buf.st_nlink);
    printf("#UID: %d\n", buf.st_uid);
    printf("#GID: %d\n", buf.st_gid);
    printf("#Size: %d\n", buf.st_size);
    printf("mode: %s\n", file_mode);
    return 0;
}
