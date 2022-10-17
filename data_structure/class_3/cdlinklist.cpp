#include<stdio.h>
#include<malloc.h>
typedef int ElemType;
typedef struct DNode
{
    ElemType data;
    struct DNode *prior;
    struct DNode *next;
}DLinkNode;
void CreateListF(DLinkNode *&L,ElemType a[],int n)
{
    DLinkNode *s;
    L=(DLinkNode *)malloc(sizeof(DLinkNode));
    L->next=NULL;
    for(int i=0;i<n;i++)
    {
        s=(DLinkNode *)malloc(sizeof(DLinkNode));
        s->data=a[i];
        s->next=L->next;
        if(L->next!=NULL)
            L->next->prior=s;
        L->next=s;
        s->prior=L;
    }
    s=L->next;
    while(s->next!=NULL)
        s=s->next;
    s->next=L;
    L->prior=s;


}

void CreateListR(DLinkNode *&L,ElemType a[],int n)
{
    DLinkNode *s,*r;
    L=(DLinkNode *)malloc(sizeof(DLinkNode));
    r=L;
    for(int i=0;i<n;i++)
    {
        s=(DLinkNode *)malloc(sizeof(DLinkNode));
        s->data=a[i];
        r->next=s;
        s->prior=r;
        r=s;
    }
    r->next=L;
    L->prior=r;
}

void DispList(DLinkNode *L)
{
    DLinkNode *p=L->next;
    while(p!=L)
    {
        printf("%c",p->data);
        p=p->next;
    }
    printf("\n");
}

void DispListRev(DLinkNode *L)
{
    DLinkNode *p=L->prior;
    while(p!=L)
    {
        printf("%c",p->data);
        p=p->prior;
    }
    printf("\n");
}