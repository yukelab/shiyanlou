#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <fcntl.h>

#define FILE_PATH "./test.txt"

int main(int argc, char *argv[])
{
    int fd;
    char buf[100];
    if (fd = open(argv[1], O_RDONLY) < 0)
    {
	printf("open error\n");
	exit(-1);
    }
    else
    {
	printf("open success\n");
    }

    read(fd, buf, 1);
    write(STDOUT_FILENO, buf, 1);
    lseek(fd, 2, SEEK_CUR);

    read(fd, buf, 1);
    write(STDOUT_FILENO, buf, 1);
    lseek(fd, -1, SEEK_END);
    
    read(fd, buf, 1);
    write(STDOUT_FILENO, buf, 1);
    lseek(fd, 0, SEEK_SET);

    read(fd, buf, 1);
    write(STDOUT_FILENO, buf, 1);
    close(fd);

    printf("\n");
    return 0;
}
