#include "cdlinklist.cpp"
int main()
{
    DLinkNode *L,*P;
    ElemType a[5]={'a','b','c','d','e'};
    CreateListF(L,a,5);
    CreateListR(P,a,5);
    printf("头插法正序输出：");DispList(L);
    printf("头插法逆序输出：");DispListRev(L);
    printf("尾插法正序输出：");DispList(P);
    printf("尾插法逆序输出：");DispListRev(P);
    return 0;
}