/**************
 * Author: weixiabing
 * Date: 2022-11-13
 * ************/
#include "sqqueue.cpp" 
//给定一个的长度为MaxSize的环形队列，其中包含有m（m<MaxSize）个字符。请设计一个算法对队列中的元素进行排序，即从队头元素开始，元素的大小依次递增，最大的元素位于队尾
//将队列划分成前后两部分，无序区在前，有序区在后。每次从无序区取出一个队头元素，
//插入到有序区。有序区初始长度为0，每次插入一个新元素长度加一。需要设置一个计数器，动态地表示有序区长度

int main(){
    //c f b f f e a b入队
    SqQueue *q;
    InitQueue(q);
    enQueue(q,'c');
    enQueue(q,'f');
    enQueue(q,'b');
    enQueue(q,'f');
    enQueue(q,'f');
    enQueue(q,'e');
    enQueue(q,'a');
    enQueue(q,'b');
    char tmp;
    int k=0,p;
    deQueue(q,tmp); 
    while(k<8)
    {   
        ElemType e;
        p=0;
        //第一个循环查找tmp应该插入的位置
        for(int i = 0; i < k; i++)
        {
            if(q->data[q->front+i] < tmp)
            {
                p++;
            }
        }
        for(int i = 0; i < p; i++)
        {
            deQueue(q,e);
            enQueue(q,e);
        }
        enQueue(q,tmp);
        for(int i = 0; i <k-p; i++)
        {
            deQueue(q,e);
            enQueue(q,e);
        }
        if(k<7) deQueue(q,tmp); 
        k++;
        for (int i=0;i<8-k-1;i++)
        {
            deQueue(q,e);
            enQueue(q,e);
        }

    }
    
    ElemType h;
    while(!QueueEmpty(q)){
        deQueue(q,h);
        printf("%c ",h);
    }
    printf("\n");
    DestroyQueue(q);
    return 0;
}