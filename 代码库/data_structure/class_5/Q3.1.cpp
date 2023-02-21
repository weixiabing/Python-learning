//利用两个顺序栈（MaxSize设为5）S1和S2，模拟一个队列，并在main()函数对队列连续执行以下操作：入队a b c, 出队a, 入队d e f g, 出队b c d
#include "sqstack.cpp"
#include <stdio.h>
#include <malloc.h>
typedef char ElemType;
typedef struct
{
    SqStack *s1,*s2;
}SqQueue;

void InitQueue(SqQueue *&q)
{
    q=(SqQueue *)malloc(sizeof(SqQueue));
    InitStack(q->s1);
    InitStack(q->s2);
}

void DestroyQueue(SqQueue *&q)
{
    DestroyStack(q->s1);
    DestroyStack(q->s2);
    free(q);
}

bool QueueEmpty(SqQueue *q)
{
    return (StackEmpty(q->s1)&&StackEmpty(q->s2));
}
//队列容量为10
//入队列
bool enQueue(SqQueue *&q,ElemType e)
{
    //s1满存入s2
    if(StackFull(q->s1))
    {
        while(!StackEmpty(q->s1))
        {
            ElemType e;
            Pop(q->s1,e);
            Push(q->s2,e);
        }
    }
    

}
//出队列,s2空，s1存入s2
bool deQueue(SqQueue *&q,ElemType &e)
{
    if(StackEmpty(q->s2))
    {
        if(StackEmpty(q->s1))
            return false;
        else
        {
            while(!StackEmpty(q->s1))
            {
                Pop(q->s1,e);
                Push(q->s2,e);
            }
        }
    }
    Pop(q->s2,e);
    return true;
}
