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

//入队列
bool enQueue(SqQueue *&q,ElemType e)
{
    if(StackFull(q->s1))
        return false;
    Push(q->s1,e);
    return true;
}
//出队列
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

int main()
{
    SqQueue *q;
    ElemType e;
    InitQueue(q);
    enQueue(q,'a');printf("入队a\n");
    enQueue(q,'b');printf("入队b\n");
    enQueue(q,'c');printf("入队c\n");
    deQueue(q,e);
    printf("出队:%c\n",e);
    enQueue(q,'d');printf("入队d\n");
    enQueue(q,'e');printf("入队e\n");
    enQueue(q,'f');printf("入队f\n");
    enQueue(q,'g');printf("入队g\n");
    deQueue(q,e);
    printf("出队:%c\n",e);
    deQueue(q,e);
    printf("出队:%c\n",e);
    deQueue(q,e);
    printf("出队:%c\n",e);
    DestroyQueue(q);
    return 0;
}

