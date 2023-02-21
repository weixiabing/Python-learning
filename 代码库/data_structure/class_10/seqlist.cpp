#include<stdio.h>
#define MAXL 100
typedef int KeyType;
typedef char InfoType;
typedef struct
{
    KeyType key;
    InfoType data;
}RecType;
 void swap(RecType &a,RecType &b)
{
    RecType temp;
    temp=a;
    a=b;
    b=temp;
}
void CreateList(RecType R[],KeyType keys[],int n)
{
    int i;
    for(i=0;i<n;i++)
    {
        R[i].key=keys[i];
    }
}

void DispList(RecType R[],int n)
{
    int i;
    for(i=0;i<n;i++)
    {
        printf("%d ",R[i].key);
    }
    printf("\n");
}

void CreateList1(RecType R[],KeyType keys[],int n)
{
    int i;
    for(i=1;i<=n;i++)
    {
        R[i].key=keys[i-1];
    }
}

void DispList1(RecType R[],int n)
{
    int i;
    for(i=1;i<=n;i++)
    {
        printf("%d ",R[i].key);
    }
    printf("\n");
}