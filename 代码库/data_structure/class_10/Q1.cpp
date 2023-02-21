#include"seqlist.cpp"
void InsertSort(RecType R[],int n)
{
    int i,j;RecType tmp;
    for(i=1;i<n;i++){
        printf("i=%d,插入%d,插入结果:",i,R[i].key);
        //插排
        if(R[i].key<R[i-1].key){
            tmp=R[i];
            j=i-1;
            do{
                R[j+1]=R[j];
                j--;
            }while(j>=0&&R[j].key>tmp.key);
            R[j+1]=tmp;
        }
        
        DispList(R,n);
    }
}

int main()
{   
    int n=10;
    KeyType a[]={9,8,7,6,5,4,3,2,1,0};
    RecType R[MAXL];
    CreateList(R,a,n);
    printf("排序前:"); DispList(R,n);
    InsertSort(R,n);
    printf("排序后:"); DispList(R,n);
    return 1;
}