/*（附加题）对任务1或者2中创建的某一个单链表{A1,B1,A2,B2,...,An,Bn}，
编写一个算法将它拆分为两个单链表，分别为：{A1,A2,...,An}和{Bn,...,B2,B1}。
要求：算法时间复杂度为O(n)，空间复杂度为O(1)。*/
#include "linklist.cpp"
//将链表L拆分为两个链表，L1为奇数位，L1采用尾插法，L2为偶数位，L2采用头插法

void split(LinkNode  *&L,LinkNode *&L1,LinkNode *&L2)
{
    LinkNode *p = L->next,*q,*r;//p指向第一个数据结点
    L1 = L;                                     //L1利用原来的结点
    r = L1;                                     //r始终指向L1的尾结点
    L2 =(LinkNode*)malloc(sizeof(LinkNode));
    L2->next =NULL;
    while (p!=NULL) {
        r->next = p;
        r = p;
        p = p->next;
        q = p->next;            //头插法会改变p的next域，用q保存结点p的后继结点
        p->next = L2->next;
        L2->next = p;
        p = q;
    }
    r->next = NULL;
}
int main()
{   
    int n=6,count=1;
    LinkNode *L,*P,*Q;
    ElemType a[6]={'a','b','c','d','e','f'};
    CreateListR(L,a,6);
	printf("L: ");
	DispList(L);
	split(L, P, Q);
	printf("P: ");
	DispList(P);
	printf("Q: ");
	DispList(Q);
	return 0;
}
   

