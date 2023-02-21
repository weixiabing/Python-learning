//在main()函数中，调用头插法（CreateListF()函数）和尾插法（CreateListR()函数），创建新链表，并输出结果进行比较
#include "linklist.cpp"
int main()
{
    LinkNode *L,*P;
    ElemType a[5]={'a','b','c','d','e'};
    CreateListF(L,a,5);
    CreateListR(P,a,5);
    DispList(L);
    DispList(P);
    return 0;
}