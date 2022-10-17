//对于一个带头节点的循环双链表，编写两个函数，分别实现在链表尾部插入节点以及删除节点的算法
#include "cdlinklist.cpp"
void InsertNode(DLinkNode *L, DLinkNode *p)
{
    DLinkNode *q = L->prior;
    q->next = p;
    p->prior = q;
    p->next = L;
    L->prior = p;
}

void DeleteNode(DLinkNode *L, DLinkNode *p)
{
    DLinkNode *q = p->prior;
    q->next = p->next;
    p->next->prior = q;
    free(p);
}

int main()
{
    DLinkNode *L, *P;
    ElemType a[5] = {'a', 'b', 'c', 'd', 'e'};
    CreateListF(L, a, 5);
    printf("头插法正序输出：");
    DispList(L);
    printf("链表尾部插入节点:");
    DLinkNode *p = (DLinkNode *)malloc(sizeof(DLinkNode));
    p->data = 'f';
    InsertNode(L, p);
    DispList(L);
    printf("删除节点:");
    DeleteNode(L, p);
    DispList(L);
    return 0;
}

