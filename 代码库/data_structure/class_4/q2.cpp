#include "listack.cpp"
int main(){
    ElemType e;
    LinkStNode *S;
    printf("链栈的基本运算如下：\n");
    printf("1.初始化链栈\n");
    InitStack(S);
    printf("2.栈为%s\n",(StackEmpty(S)?"空":"非空"));
    printf("3.依次进栈元素a,b,c,d,e\n");
    Push(S,'a');
    Push(S,'b');
    Push(S,'c');
    Push(S,'d');
    Push(S,'e');
    printf("4.栈为%s\n",(StackEmpty(S)?"空":"非空"));
    printf("6.出栈序列为：");
    while(!StackEmpty(S))
    {
        Pop(S,e);
        printf("%c ",e);
    }
    printf("\n");
    printf("7.栈为%s\n",(StackEmpty(S)?"空":"非空"));
    printf("8.释放栈\n");
    DestroyStack(S);
    return 1;
}