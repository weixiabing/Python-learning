#include "seqlist.cpp"
void disppart(RecType R[],int s,int t){
    static int i=1;
    int j;
    printf("第%d次划分:",i);
    for (j=0;j<s;j++) printf("  ");
    for (j=s;j<=t;j++) printf("%3d ",R[j].key);
    printf("\n");
    i++;
}

int partition(RecType R[],int s,int t){
    int i=s,j=t;
    RecType tmp=R[i];
    while(i<j){
        while(i<j&&R[j].key>=tmp.key) j--;
        R[i]=R[j];
        while(i<j&&R[i].key<=tmp.key) i++;
        R[j]=R[i];
    }
    R[i]=tmp;
    disppart(R,s,t);
    return i;
}

void QSort(RecType R[],int low,int high){
    int pivot;
    if(low<high){
        pivot=partition(R,low,high);
        QSort(R,low,pivot-1);
        QSort(R,pivot+1,high);
    }
}

int main(){
    int n=10;
    KeyType a[]={6,8,7,9,0,1,3,2,4,5};
    RecType R[MAXL];
    CreateList(R,a,n);
    printf("排序前:"); DispList(R,n);
    QSort(R,0,n-1);
    printf("排序后:"); DispList(R,n);
    return 1;
}