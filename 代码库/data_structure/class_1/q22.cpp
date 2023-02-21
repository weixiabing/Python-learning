#include <stdio.h>
int main ()
{  int var1, i;
   int var2[5];
   printf("var1 变量的地址： %p\n", &var1  );   
   for(i=0; i<5; i++)
    printf("int型var2[%d] 变量的地址： %p\n", i, &var2[i] );
    float var3[5];
    for(i=0; i<5; i++)
    printf("float型var3[%d] 变量的地址： %p\n", i, &var3[i] );
    double var4[5];
    for(i=0; i<5; i++)
    printf("double型var4[%d] 变量的地址： %p\n", i, &var4[i] );
 }