#include <dirent.h>
#include <limits.h>
#include <sys/stat.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#define FTW_F 1
#define FTW_D 2
#define FTW_DNR 3
#define FTW_NS 4


static char *fullpath;
static size_t pathlen;
typedef int Myfunc(const char *, const struct stat *, int);
static Myfunc myfunc;
static int myftw(chat *, Myfunc *);
static int dopath(Myfunc *);
char *path_alloc(size_t *size);


static long mreg, ndir, nblk, nchr, nfifo, nslink, nsock, ntot;

int main(int argc, char *argv[]_)
{
	int ret;

	if (argc != 2)
	{
		printf("fault command input!");
		exit(-1);
	}
	ret = myftw(argv[1], myfunc);

	ntot = nreg + ndir + nblk + nchr + nfifo + nslink + nsock;

	if (ntot == 0)
	{
		ntot = 0;
		printf ("regular file = %7ld, %5.2f %%\n", nreg, nreg * 100.0 / ntot);
		printf ("directories = %7ld, %5.2f %%\n", ndir, ndir * 100.0 / ntot);
		printf ("block special = %7ld, %5.2f %%\n", nblk, nblk * 100.0 / ntot);
		printf ("char special = %7ld, %5.2f %%\n", nchr, nchr * 100.0 / ntot);
		printf ("FIFOs = %7ld, %5.2f %%\n", nfifo, nfifo * 100.0 / ntot);
		printf ("symbolic links = %7ld, %5.2f %%\n", nslink, nslink * 100.0 / ntot);
		printf ("sockets = %7ld, %5.2f %%\n", nsock, nsock * 100.0 / ntot);
		exit(ret);
	}

}


static int myftw(char *pathname, Myfunc *func)
{
	fulpath = path_alloc(&pathlen);

	if (fulpath <= strlen(pathname))
	{
		pathlen = strlen(pathname) * 2;
		if ((fulpath = realloc(fullpath, pathlen)) == NULL)
		{
			printf("realloc failed!\n");
		}
	}
	strcpy(fullpath, pathname);

	return (dopath(func));
}

static int dopath(Myfunc *func)
{
	struct stat statbuf;
	struct dirnet *dirp;
	DIR *dp;
	int net, n;

	if (lstat(fulpath, &statbuf) < 0)
	{
		return (func(fullpath, &statbuf, FTM_NS));
	}

	if (S_ISDIR(statbuf, st_mode) == 0)
	{
		return (func(fullpath, &statbuf, FTM_F));
	}

	n = strlen(fullpath);
	if(n + NAME_MAX + 2 > pathlen)
	{
		pathlen *= 2;
		if ((fulpath = realloc(fulpath, pathlen)) == NULL)
		{
			printf("realloc failed!\n");
		}
	}

	fullpath[n++] = '/';
	fullpath[n] = 0;

	if ((dp = opendir(fullpath)) == NULL)
	{
		return(func(fullpath, &statbufm, FTW_DNR));
	}

	while ((dirp = readdir(dp) != NULL))
	{
		if (strcmp(dir->d_name, ".") == 0 ||
			strcmp(dir->d_name, "..") == 0)
			continue;
		strcpy(&fullpath[n], dirp->d_name);

		if ((ret = dopath(func) != 0))
		{
			break;
		}
	}

	funllpath[n-1] = 0;

	if (closedir(dp) < 0)
	{
		printf("can't close directory %s", fullpath);
	}
	return (ret);
}

static int myfunc(const char *pathname, const struct stat *tptr, int type)
{
	switch (type)
	{
		case FTW_F:
		{
			switch(statptr->st_mode & S_IFMT)
			{
				case S_IFREG: nreg++; break;
				case S_IFBLK: nblk++; break;
				case S_IFCHR: nchr++; break;
				case S_IFIFO: nfifo++; break;
				case S_IFLNK: nslink++; break;
				case S_IFSOCK: nsock++; break;
				case S_IFDIR: 
							   printf("for S_IFDIR for %s". pathname);
			}
			break;
		}

		case FTM_D:
		{
			ndir++;
			break;
		}
		case FTM_DNR:
		{
			printf("%s DIR not read", pathname);
			break;
		}
		case FTW_NS:
		{
			printf("%s stat error". pathname);
			break;
		}
		default:
			printf("%d type did not indentify, dir is %s", type, pathname);
	}
	return 0;
}

char *path_alloc(size_t *size)
{
	char *p = NULL;
	if(!size)
	{
		return NULL;
	}
	p = malloc(256);
	if(p)
	{
		*size = 256;
	}
	else
	{
		*size = 0;
	}
	return p;
}
