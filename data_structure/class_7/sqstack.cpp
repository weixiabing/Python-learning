#include <stdio.h>
#include <malloc.h>
#define MaxSize 100
typedef char ElemType;
typedef struct {
    ElemType data[MaxSize];
    int top;
} SqStack;
void InitStack(SqStack *&S) {
    S = (SqStack *)malloc(sizeof(SqStack));
    S->top = -1;
}

void DestroyStack(SqStack *&S) {
    free(S);
}

bool StackEmpty(SqStack *S) {
    return (S->top == -1);
}

bool Push(SqStack *&S, ElemType e) {
    if (S->top == MaxSize - 1)
        return false;
    S->top++;
    S->data[S->top] = e;
    return true;
}

bool Pop(SqStack *&S, ElemType &e) {
    if (S->top == -1)
        return false;
    e = S->data[S->top];
    S->top--;
    return true;
}

bool GetTop(SqStack *S, ElemType &e) {
    if (S->top == -1)
        return false;
    e = S->data[S->top];
    return true;
}