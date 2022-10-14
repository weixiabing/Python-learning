#include "sqlist.cpp"
int main(){
    SqList *L;
    ElemType e[6] = {'a', 'b', 'c', 'd', 'e','f'};
    CreateList(L,e,6);
    DispList(L);
    return 0;

}