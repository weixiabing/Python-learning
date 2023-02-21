#include "seqlist.cpp"
void BubbleSort(RecType R[],int n)
{
    int i,j;
    RecType tmp;
    for(i=0;i<n-1;i++){
        printf("i=%d,冒泡结果:",i);
        for(j=0;j<n-i-1;j++){
            if(R[j].key>R[j+1].key){
                tmp=R[j];
                R[j]=R[j+1];
                R[j+1]=tmp;
            }
        }
        DispList(R,n);
    }
}

int main(){
    int n=10;
    KeyType a[]={6,8,7,9,0,1,3,2,4,5};
    RecType R[MAXL];
    CreateList(R,a,n);
    printf("排序前:"); DispList(R,n);
    BubbleSort(R,n);
    printf("排序后:"); DispList(R,n);
    return 1;

}