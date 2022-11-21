#include<stdio.h>
#include<mm_malloc.h>
#include<time.h>
#define MAXSize 8
typedef int ElemType;
//int a[MAXSize];
typedef struct
{
    ElemType data[MAXSize + 1];
    int front, rear;//队首和队尾指针
}SqQueue;//声明环形队列类型
void InitQueue(SqQueue*& q)//初始化队列q
{
    q = (SqQueue*)malloc(sizeof(SqQueue));
    q->front = q->rear = 0;
}
void DestoryQueue(SqQueue*& q)//销毁队列q
{
    free(q);
}
bool QueueEmpty(SqQueue* q)//判断队列q是否空
{
    return(q->front == q->rear);
}
bool enQueue(SqQueue*& q, ElemType e)//进队
{
    if ((q->rear +1) % (MAXSize +1) == q->front)
        return false;//队满，上溢出，返回假
    q->rear = (q->rear + 1) % (MAXSize + 1);
    q->data[q->rear] = e;
    return true;
}
bool deQueue(SqQueue*& q, ElemType& e)//出队
{
    if (q->front == q->rear)
        return false;//队空，下溢出，返回假
    q->front = (q->front + 1) % (MAXSize + 1);
    e = q->data[q->front];
    return true;
}

int main()
{
   
    ElemType e;
    SqQueue* q;
   
    InitQueue(q);
    printf("依次进队列元素c,f,b,f,f,e,a,b:\n");
    if (!enQueue(q,'c'))printf("\t提示：队满，不能进队\n");
    if (!enQueue(q,'f'))printf("\t提示：队满，不能进队\n");
    if (!enQueue(q,'b'))printf("\t提示：队满，不能进队\n");
    if (!enQueue(q,'f'))printf("\t提示：队满，不能进队\n");
    if (!enQueue(q,'f'))printf("\t提示：队满，不能进队\n");
    if (!enQueue(q,'e'))printf("\t提示：队满，不能进队\n");
    if (!enQueue(q,'a'))printf("\t提示：队满，不能进队\n");
    if (!enQueue(q,'b'))printf("\t提示：队满，不能进队\n");
    printf("队列为%s\n", (QueueEmpty(q) ? "空" : "非空"));
    printf("排序结果为：");
    int n = 8;
    for (int i = 0; i < n; i++) {
        deQueue(q, e); 
        int m = e;
        for (int j = 0; j < n - i - 1; j++) {
            deQueue(q, e);
            if (e > m) {
                enQueue(q, m);
                m = e;
            }
            else enQueue(q, e);
        }
        enQueue(q,m);
        for (int k = 0; k < i; k++) {
            deQueue(q, e);
            enQueue(q, e);
        }
    }
    while (!QueueEmpty(q))
    {
        deQueue(q, e);
        printf("%c", e);

    }
    printf("\n");
    printf("释放队列\n");
    DestoryQueue(q);
  
    return 1;
}