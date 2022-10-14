#include "sqlist.cpp"
int main ()
{
    SqList *L;
    ElemType e;
    printf("顺序表的基本运算如下：\n");
    printf("1.初始化顺序表L\n");
    InitList(L);
    printf("2.依次插入a,b,c,d,e元素\n");
    ListInsert(L,1,'a');
    ListInsert(L,2,'b');
    ListInsert(L,3,'c');
    ListInsert(L,4,'d');
    ListInsert(L,5,'e');
    printf("3.输出顺序表中的元素:");DispList(L);
    printf("4.顺序表的长度为：%d\n",ListLength(L));
    printf("5.顺序表L为空否？%d(1:是 0:否)\n",ListEmpty(L));
    GetElem(L,3,e);
    printf("6.顺序表的第3个元素为：%c\n",e);
    printf("7.顺序表中元素a的位置为：%d\n",LocateElem(L,'a'));
    printf("8.在顺序表的第4个位置插入元素f\n");
    ListInsert(L,4,'f');
    printf("9.输出顺序表中的元素:");DispList(L);
    printf("10.删除顺序表的第3个元素\n");
    ListDelete(L,3,e);
    printf("11.输出顺序表中的元素:");DispList(L);
    printf("12.清空顺序表\n");
    DestroyList(L);
    return 1;

}