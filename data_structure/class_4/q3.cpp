#include "listack.cpp"
#include <stdio.h>
//判断表达式{}[]()是否配对
bool Match(char *str)
{
    LinkStNode *s;
    InitStack(s);
    while (*str!='\0')
    {
        if (*str=='('||*str=='['||*str=='{')
            Push(s,*str);
        else if (*str==')'||*str==']'||*str=='}')
        {
            if (StackEmpty(s))
                return false;
            char e;
            Pop(s,e);
            if (*str==')'&&e!='(')
                return false;
            if (*str==']'&&e!='[')
                return false;
            if (*str=='}'&&e!='{')
                return false;
        }
        str++;
    }
    if (StackEmpty(s))
        return true;
    else
        return false;
}

int main(){
    char str[100];
    printf("请输入表达式：");
    scanf("%s",str);
    if (Match(str))
        printf("配对成功！\n");
    else
        printf("配对失败！\n");
    return 0;
}