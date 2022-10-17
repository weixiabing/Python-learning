#include "/workspaces/Python-learning/data_structure/class_2/linklist.cpp"
//给定一个带头节点的单链表L，设计算法查找倒数第m个节点上的数据
void FindNode(LinkNode *&L, int m)
{
    LinkNode *p = L->next;
    LinkNode *q = L->next;
    int i = 0;
    while (p != NULL)
    {
        if (i >= m)
        {
            q = q->next;
        }
        p = p->next;
        i++;
    }
    printf("倒数第%d个节点的值为%c\n ", m, q->data);
}
int main()
{
    LinkNode *L;
    ElemType a[5] = {'a', 'b', 'c', 'd', 'e'};
    CreateListR(L, a, 5);
    printf("尾插法正序输出：");
    DispList(L);
    FindNode(L, 2);
    return 0;
}
