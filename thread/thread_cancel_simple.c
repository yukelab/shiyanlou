#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <pthread.h>
#include <errno.h>
#define handle_error_en(en,msg) \
	do { errno=en; perror(msg); exit(EXIT_FAILURE);}while(0)
extern char *mystrerror(int err);

static void *thread_routine(void *arg)
{
	int j;
	printf("New thread started!\n");

	for (j = 1; ;j++)
	{
		printf("loop %d\n", j);
		sleep(1);
	}
	return NULL;
}

int main(int argc, char *argv[])
{
	pthread_t thr;
	int s;
	void *res;

	s = pthread_create(&thr, NULL, thread_routine, NULL);
	if (s!=0)
		handle_error_en(s, "pthread_create");
	
	sleep(3);
	s = pthread_cancel(thr);
	if (s != 0)
		handle_error_en(s, "pthread_cancel");

	s = pthread_join(thr, &res);
	if (s != 0)
		handle_error_en(s, "pthread_join");
	if (res == PTHREAD_CANCELED)
		printf("Thread was canceled\n");
	else 
		printf("Thread was not canceled(should not happen!)\n");

	return 0;
}

