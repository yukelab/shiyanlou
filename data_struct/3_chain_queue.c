#include <stdio.h>
#include <stdlib.h>

#define TRUE 1
#define FALSE 0
#define OK 1
#define ERROR 0
#define OVERFLOW	 -2

typedef int Status;
typedef int QElemType;

typedef struct QNode
{
	QElemType data;
	struct QNode *next;
}QNode, *QueuePtr;

typedef struct 
{
	QueuePtr front;
	QueuePtr rear;
}LinkQueue;


Status InitQueue(LinkQueue *Q)
{
	Q->front = Q->rear = (QueuePtr) malloc(sizeof(QNode));
	if (!Q->front)
	{
		exit(OVERFLOW);
	}
	Q->front->next = NULL;
	return OK;
}

Status DestoryQueue(LinkQueue *Q)
{
	while (Q->front)
	{
		Q->rear = Q->front->next;
		free(Q->front);
		Q->front = Q->rear;
	}
	return OK;
}

Status ClearQueue(LinkQueue *Q)
{
	DestoryQueue(Q);
	InitQueue(Q);
	return OK;
}

Status isEmpty(LinkQueue Q)
{
	if (Q.front->next == NULL)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	}
}

int GetLength(LinkQueue Q)
{
	int i = 0;
	QueuePtr p = Q.front;
	
	while(Q.rear != p)
	{
		i++;
		p = p->next;
	}
	return i;
}

Status GetHead(LinkQueue Q, QElemType *e)
{
	QueuePtr p;
	if (Q.front == Q.rear)
	{
		return ERROR;
	}
	p = Q.front->next;
	*e = p->data;
	return OK;
}

Status EnQueue(LinkQueue *Q, QElemType e)
{
	QueuePtr p = (QueuePtr)malloc(sizeof(QNode));
	if (!p)
	{
		exit(OVERFLOW);
	}
	p->data = e;
	p->next = NULL;
	Q->rear->next = p;
	Q->rear = p;
	return OK;
}



Status DeQueue(LinkQueue *Q, QElemType *e)
{
	QueuePtr p;
	if (Q->front == Q->rear)
	{
		return ERROR;
	}
	p = Q->front->next;
	*e = p->data;
	Q->front->next = p->next;
	if (Q->rear == p)
	{
		Q->rear = Q->front;
	}
	free(p);	
	return OK;
}

void visit(QElemType e)
{
	printf("%d ", e);
}

Status TraverseQueue(LinkQueue Q, void (*visit)(QElemType))
{
	QueuePtr p = Q.front->next;
	while(p)
	{
		visit(p->data);
		p = p->next;
	}
	return OK;
}


int main()
{
	LinkQueue Q;
	if (InitQueue(&Q))
	{
		QElemType e;
		int i;
		printf ("init_success\n");

		if (isEmpty(Q))
		{
			printf("list is empth\n");
		}
		else
		{
			printf("list is not empth\n");
		}

		for (i = 0; i < 10; i++)
		{
			EnQueue(&Q, i);
		}
		
		if (GetHead(Q, &e))
		{
			printf("The first element is %d\n", e);
		}
		else
		{
			printf("element is not exists\n");
		}

		printf("length is %d\n", GetLength(Q));

		DeQueue(&Q, &e);
		printf("Pop element is %d\n", e);
		

		printf("Queue:");
		TraverseQueue(Q, *visit);
		if (DestoryQueue(&Q))
		{
			printf("\ndestory_success\n");
		}
	}
}
		
