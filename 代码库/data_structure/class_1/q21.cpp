#include<stdio.h>
int main()
{
    int var1,i;
    char var2[5];
    //查看var1的地址
    printf("var1的地址为%p\n",&var1);
    //查看var2的地址
    for(i=0;i<5;i++)
    {
        printf("var2[%d]的地址为%p\n",i,&var2[i]);}
}