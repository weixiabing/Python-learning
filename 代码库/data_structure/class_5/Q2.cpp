#include "liqueue.cpp"
int main()
{
    ElemType e;
    LinkQuNode *q;
    printf("链队列的基本运算如下：\n");
    printf("1.初始化队列\n");
    InitQueue(q);
    printf("2.依次进队元素a,b,c\n");
    enQueue(q,'a');
    enQueue(q,'b');
    enQueue(q,'c');
    printf("3。队列是否为空？%d(1:是 0:否)\n",QueueEmpty(q));
    if(deQueue(q,e)==0)
        printf("队空，不能出队\n");
    else
        printf("4.出队元素%c\n",e);
    printf("5.依次进队元素d,e,f\n");
    enQueue(q,'d');
    enQueue(q,'e');
    enQueue(q,'f');
    printf("6.出队序列：");
    while(!QueueEmpty(q))
    {
        deQueue(q,e);
        printf("%c ",e);
    }
    printf("\n");
    printf("7.销毁队列\n");
    DestroyQueue(q);
    return 1;


}