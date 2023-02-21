#include "sqqueue.cpp"
int main(){
    ElemType e;
    SqQueue *q;
    printf("1.环形队列的基本运算如下：\n");
    InitQueue(q);
    printf("2.依次进队列元素a,b,c,d,e:\n");
    if(!enQueue(q,'a')) printf("队列已满，不能再进队列元素！\n");
    if(!enQueue(q,'b')) printf("队列已满，不能再进队列元素！\n");
    if(!enQueue(q,'c')) printf("队列已满，不能再进队列元素！\n");
    if(!enQueue(q,'d')) printf("队列已满，不能再进队列元素！\n");
    if(!enQueue(q,'e')) printf("队列已满，不能再进队列元素！\n");
    printf("3.队列为%s\n",QueueEmpty(q)?"空":"非空");
    printf("4.出队列元素：");
    while(!QueueEmpty(q)){
        deQueue(q,e);
        printf("%c ",e);
    }
    printf("\n");
    printf("5.队列为%s\n",QueueEmpty(q)?"空":"非空");
    DestroyQueue(q);
    return 1;

}