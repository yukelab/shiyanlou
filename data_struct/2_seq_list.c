#include <stdio.h>
#include <stdlib.h>

#define TRUE 1
#define FALSE 0
#define OK 1
#define ERROR 0
#define OVERFLOW	 -2

typedef int Status;
typedef int Elemtype;

typedef struct LNode
{
	Elemtype *elem;
	struct LNode *next;
}LNode, *Linklist;


Status InitList(Linklist *L)
{
	*L = (Linklist) malloc(sizeof(LNode));
	if (!L->elem)
	{
		exit(OVERFLOW);
	}
	(*L)->next = NULL;
	return OK;
}

void DestoryList(Linklist *L)
{
	Linklist temp;
	while (*L)
	{
		temp = (*L)->next;
		free(L);
		*L = temp;
	}
}

void ClearList(Linklist *L)
{
	Linklist p = L->next;
	L->next = NULL;
	DestoryList(&p);
}

Status isEmpty(const Linklist L)
{
	if (L.next)
	{
		return FALSE;
	}
	else
	{
		return TRUE;
	}
}

Status getLength(const Linklist L)
{
	int i = 0;
	Linklist p = L->next;
	
	while(p)
	{
		i++;
		p = p->next;
	}
	return i;
}

Status GetElem(const Linklist L, int i, Elemtype *e)
{
	int j = 1;
	Linklist p = L->next;
	while (p && j < i)
	{
		j++;
		p = p->next;
	}

	if (!p || j > i)
	{
		return ERROR;
	}
	*e = p->data;
	return OK;
}

Status compare(Elemtype e1, Elemtype e2)
{
	if (e1 == e2)
	{
		return 0;
	}
	else if (e1 < e2)
	{
		return -1;
	}
	else
	{
		return 1;
	}
}

Status FindElem(Linklist L, Elemtype e, Status (*compare)(Elemtype,Elemtype))
{
	int i = 0;
	Linklist p = L->next;
	while (p)
	{
		i++;
		if(!(*compare)(p->data,e))
		{
			return i;
		}
		p = p->next;
	}
	return 0;
}
		

Status PreElem(const Linklist L, Elemtype cur_e, Elemtype *pre_e)
{
	Linklist q, p = L->next;
	while (p->next)
	{
		q = p->next;
		if (q->data == cur_e) 
		{
			*pre_e = p->data;
			return OK;
		}
		p = q;
	}
	return ERROR;
}	
	


Status NextElem(const Linklist L, Elemtype cur_e, Elemtype *next_e)
{
	Linklist p = L->next;
	while (p->next)
	{
		if (q->data == cur_e) 
		{
			*next_e = p->next->data;
			return OK;
		}
		p = p->next;
	}
	return ERROR;
}

Status InsertElem(Linklist *L, int i, Elemtype e)
{
	int j = 0;
	Linklist s, p = L;
	while (p || j < i -1)
	{
		j++;
		p = p->next;
	}
	
	if (!p || j < i -1)
	{
		return ERROR;
	}
	
	s = (Linklist) malloc(sizeof(LNode));
	s->data = e;
	s->next = p->next;
	p->next = s;
	return OK;
}


Status DeleteElem(Linklist *L, int i, Elemtype *e)
{
	int j = 0;
	Linklist q, p = L;
	while (p || j < i -1)
	{
		j++;
		p = p->next;
	}
	
	if (!p || j < i -1)
	{
		return ERROR;
	}
	
	q = p->next;
	p->next = q->next;
	*e = q->data;
	free(q);
	return OK;
}

void visit(Elemtype e)
{
	printf("%d ", e);
}

void TraverseList(const Linklist L, void (*visit)(Elemtype))
{
	Linklist p = L->next;
	while(p)
	{
		visit(L.elem[i]);
		p = p->next;
	}
}


int main()
{
	Linklist L;
	InitList(&L);
	Elemtype e;
	
	int i;
	if (L)
	{
		printf ("init_success\n");
	}

	if (isEmpty(L))
	{
		printf("list is empth\n");
	}

	for (i = 0; i < 10; i++)
	{
		InsertElem(&L, i+1, i);
	}
		
	if (GetElem(L, 1, &e))
	{
		printf("The first element is %d\n", e);
	}
	else
	{
		printf("element is not exists\n");
	}

	printf("length is %d/n",getLength(L));

	printf("The element 5 at location %d\n", FindElem(L, 5, *compare));
	
	PreElem(L, 6, &e);
	printf("The 6's previous element is %d\n", e);


	NextElem(L, 6, &e);
	printf("The 6's next element is %d\n", e);

	DeleteElem(&L, 1, &e);
	printf("delete first element is %d\n", e);
	

	printf("list:");
	TraverseList(L, visit);
	if (DestoryList(&L))
	{
		printf("\ndestory_success\n");
	}
}
		
