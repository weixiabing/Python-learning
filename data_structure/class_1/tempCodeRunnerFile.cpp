#include <stdio.h>
int main (){
    //自定义一个结构体数组，查看数组中相邻变量的地址
    struct var{
        int num;
        char name[];
    };
    struct var var1[5];
    int i;
    for(i=0;i<5;i++)
    {
        printf("stu[%d]的地址为%p\n",i,&var1[i]);
    }
}