#include <stdio.h>
#include <malloc.h>
#define MaxSize 100
typedef char ElemType;
typedef struct
{
    ElemType data[MaxSize];
    int front,rear;
}SqQueue;

void InitQueue(SqQueue *&q)
{
    q=(SqQueue *)malloc(sizeof(SqQueue));
    q->front=q->rear=0;
}

void DestroyQueue(SqQueue *&q)
{
    free(q);
}

bool QueueEmpty(SqQueue *q)
{
 return (q->front==q->rear);
}


bool enQueue(SqQueue *&q,ElemType e)
{
    if((q->rear+1)%MaxSize==q->front)
        return false;
    q->data[q->rear]=e;
    q->rear=(q->rear+1)%MaxSize;
    return true;
}
bool deQueue(SqQueue *&q,ElemType &e)
{
    if(q->front==q->rear)
        return false;
    e=q->data[q->front];
    q->front=(q->front+1)%MaxSize;
    return true;
}


