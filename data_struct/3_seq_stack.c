#include <stdio.h>
#include <stdlib.h>

#define TRUE 1
#define FALSE 0
#define OK 1
#define ERROR 0
#define OVERFLOW	 -2
#define INIT_SIZE 20
#define INCREMENT_SIZE 5

typedef int Status;
typedef int SElemtype;

typedef struct 
{
	SElemtype *base;
	SElemtype *top;
	int size;
}SqStack;


Status InitStack(SqStack *S)
{
	S->base = (SElemtype *) malloc(INIT_SIZE * sizeof(SElemtype));
	if (!S->base)
	{
		return ERROR;
	}
	S->top = S->base;
	S->size = INIT_SIZE;
	return OK;
}

Status DestoryStack(SqStack *S)
{
	free(S->base);
	S->base = NULL;
	S->top = NULL;
	S->size = 0;
	return OK;
}

Status ClearStack(SqStack *S)
{
	S->top = S->base;
	return OK;
}

Status isEmpty(const SqStack S)
{
	if (S.top == S.base)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	}
}


int GetLength(SqStack S)
{
	return S.top - S.base;
}

Status GetTop(SqStack S, SElemtype *e)
{
	if (S.top > S.base)
	{
		*e = *(--S.base);
		return OK;
	}
	else
	{
		return ERROR;
	}
}

Status Push(SqStack *S, SElemtype e)
{
	if ((S->top - S->base)/sizeof(SElemtype) >= S->size)
	{
		S->base = (SElemtype *) realloc(S->base, (S->size + INCREMENT_SIZE) * sizeof(SElemtype));
		if (!S->base)
		{
			exit(OVERFLOW);
		}
		S->top = S->base + S->size;
		S->size += INCREMENT_SIZE;
	}
	*S->top = e;
	S->top++;
	return OK;
}



Status Pop(SqStack *S, SElemtype *e)
{
	if (S->top == S->base)
	{
		return OK;
	}
	S->top--;
	*e = *S->top;
	return OK;
}



void visit(SElemtype e)
{
	printf("%d ", e);
}



Status TraverseStack(SqStack S, void (*visit)(SElemtype))
{
	while(S.top > S.base)
	{
		visit(*S.base);
		S.base++;
	}
	return OK;
}

int main()
{
	SqStack S;
	if (InitStack(&S))
	{
		SElemtype e;
		int i;
		printf ("init_success\n");

		if (isEmpty(S))
		{
			printf("list is empth\n");
		}
		else
		{
			printf("list is not empth\n");
		}

		for (i = 0; i < 10; i++)
		{
			Push(&S, i);
		}
		
		if (GetTop(S, &e))
		{
			printf("The first element is %d\n", e);
		}
		else
		{
			printf("element is not exists\n");
		}

		printf("length is %d\n", GetLength(S));

		Pop(&S, &e);
		printf("Pop element is %d\n", e);
		

		printf("list:");
		TraverseStack(S, visit);
		if (DestoryStack(&S))
		{
			printf("\ndestory_success\n");
		}
	}
}
