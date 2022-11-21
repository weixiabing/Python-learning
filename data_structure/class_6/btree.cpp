#include <stdio.h>
#include <malloc.h>
#define MaxSize 100
typedef char ElemType;
typedef struct node
{
    ElemType data;
    struct node *lchild, *rchild;
} BTNode;
void CreateBTree(BTNode *&b,char *str){
    BTNode *St[MaxSize],*p;
    int top=-1,k,j=0;char ch;
    b=NULL;
    ch=str[j];
    while(ch!='\0'){
        switch(ch){
            case '(':top++;St[top]=p;k=1;break;
            case ')':top--;break;
            case ',':k=2;break;
            default:p=(BTNode *)malloc(sizeof(BTNode));
                    p->data=ch;p->lchild=p->rchild=NULL;
                    if(b==NULL)b=p;
                    else{
                        switch(k){
                            case 1:St[top]->lchild=p;break;
                            case 2:St[top]->rchild=p;break;
                        }
                    }
        }
        j++;
        ch=str[j];
    }
}

void DestroyBTree(BTNode *&b){
    if(b!=NULL){
        DestroyBTree(b->lchild);
        DestroyBTree(b->rchild);
        free(b);
    }
}

BTNode *FindNode(BTNode *b,ElemType x){
    BTNode *p;
    if(b==NULL)return NULL;
    else if(b->data==x)return b;
    else{
        p=FindNode(b->lchild,x);
        if(p!=NULL)return p;
        else return FindNode(b->rchild,x);
    }
}

BTNode *LchildNode(BTNode *p){
    return p->lchild;
}

BTNode *RchildNode(BTNode *p){
    return p->rchild;
}

int BTHeight(BTNode *b){
    int lchildh,rchildh;
    if(b==NULL)return 0;
    else{
        lchildh=BTHeight(b->lchild);
        rchildh=BTHeight(b->rchild);
        return (lchildh>rchildh)?(lchildh+1):(rchildh+1);
    }
}

void DispBTree(BTNode *b){
    if(b!=NULL){
        printf("%c",b->data);
        if(b->lchild!=NULL||b->rchild!=NULL){
            printf("(");
            DispBTree(b->lchild);
            if(b->rchild!=NULL)printf(",");
            DispBTree(b->rchild);
            printf(")");
        }
    }
}