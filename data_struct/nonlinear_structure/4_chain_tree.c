#include <stdio.h>
#include <stdlib.h>

#define TRUE 1
#define FALSE 0
#define OVERFLOW	 -2
#define OK 1
#define ERROR 0

typedef int Status;
typedef int TElemType;

typedef struct BiTNode
{
	TElemType data;
	struct BiTNode *lchild, *rchild;
}BiTNode, *BiTree;


Status CreateBiTree(BiTree *T)
{
	TElemType e;
	scanf("%d",&e);
	*T = (BiTree) malloc(sizeof(BiTNode));
	if (e == 0)
	{
		*T = NULL;
	}
	else
	{
		*T = (BiTree)malloc(sizeof(BiTNode));
		if (!T)
		{
			exit(OVERFLOW);
		}
		(*T)->data = e;
		CreateBiTree(&(*T)->lchild);
		CreateBiTree(&(*T)->rchild);
	}
	return OK;
}

void visit(TElemType e)
{
	printf("%d ", e);
}



void PreOrderTraverse(BiTree T, void (*visit)(TElemType))
{
	if(T)
	{
		visit(T->data);
		PreOrderTraverse(T->lchild, visit);
		PreOrderTraverse(T->rchild, visit);
	}
}

void InOrderTraverse(BiTree T, void (*visit)(TElemType))
{
	if(T)
	{
		PreOrderTraverse(T->lchild, visit);
		visit(T->data);
		PreOrderTraverse(T->rchild, visit);
	}
}

void PostOrderTraverse(BiTree T, void (*visit)(TElemType))
{
	if(T)
	{
		PreOrderTraverse(T->lchild, visit);
		PreOrderTraverse(T->rchild, visit);
		visit(T->data);
	}
}

int main()
{
	BiTree T;
	printf ("create tree , when input is 0 : zero tree\n");
	CreateBiTree(&T);
	printf ("preolder traversal\n");
	PreOrderTraverse(T, *visit);
	printf ("inolder traversal\n");
	InOrderTraverse(T, *visit);
	printf ("postolder traversal\n");
	PostOrderTraverse(T, *visit);
	printf ("\n");
	return 0;
}
		
