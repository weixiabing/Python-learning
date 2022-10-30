#include "sqstack.cpp"
int main()
{
    ElemType e;
    SqStack *S;
    printf("顺序栈的基本运算如下：\n");
    printf("1.初始化顺序栈\n");
    InitStack(S);
    printf("2.栈为%s\n",(StackEmpty(S)?"空":"非空"));
    printf("3.依次进栈元素1,2,3,4,5,6\n");
    Push(S,'1');
    Push(S,'2');
    Push(S,'3');
    Push(S,'4');
    Push(S,'5');
    Push(S,'6');
    printf("4.栈为%s\n",(StackEmpty(S)?"空":"非空"));
    printf("5.栈顶序列为：");
    while(!StackEmpty(S))
    {
        Pop(S,e);
        printf("%c ",e);
    }
    printf("\n");
    printf("6.栈为%s\n",(StackEmpty(S)?"空":"非空"));
    printf("7.释放栈\n");
    DestroyStack(S);
    return 1;

}