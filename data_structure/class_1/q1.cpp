#include "sqlist.cpp"
int main(){
    SqList *L;
    ElemType e[10] = {'a', 'b', 'c', 'c','d','d','f','g','h','i'};  // 初始化顺序表;
    CreateList(L,e,10);
    DispList(L);
    //删除重复的元素
    int k=0,i=1;
    while(i<L->length){
        if(L->data[i]==L->data[k]){
            i++;
        }
        else{
            k++;
            L->data[k]=L->data[i];
            i++;
        }
    }
    L->length=k+1;
    DispList(L);
}