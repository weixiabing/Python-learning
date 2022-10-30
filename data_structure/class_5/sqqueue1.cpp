#include <stdio.h>
#include <malloc.h>
#define MaxSize 5
typedef char ElemType;
typedef struct
{
    ElemType data[MaxSize];
    int front,rear;
}SqQueue;

//可以设定一个变量来保存队列的长度
int length=0;
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

//入队列
bool enQueue(SqQueue *&q,ElemType e)
{
    if(length==MaxSize)
        return false;
    q->data[q->rear]=e;
    q->rear=(q->rear+1)%MaxSize;
    length++;
    return true;
}
//出队列
bool deQueue(SqQueue *&q,ElemType &e)
{
    if(length==0)
        return false;
    e=q->data[q->front];
    q->front=(q->front+1)%MaxSize;
    length--;
    return true;
}
