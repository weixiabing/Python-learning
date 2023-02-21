#include "/workspaces/Python-learning/data_structure/class_6/btree.cpp"
void PreOrder(BTNode *b)
{
    if (b != NULL)
    {
        printf(" %c", b->data);
        PreOrder(b->lchild);
        PreOrder(b->rchild);
    }
}
void PreOrder1(BTNode *b)
{
    BTNode *St[MaxSize], *p;
    int top = -1;
    if (b != NULL)
    {
        top++;
        St[top] = b;
        while (top > -1)
        {
            p = St[top];
            top--;
            printf("%c ", p->data);
            if (p->rchild != NULL)
            {
                top++;
                St[top] = p->rchild;
            }
            if (p->lchild != NULL)
            {
                top++;
                St[top] = p->lchild;
            }
        }
        printf("\n");
    }
}

void InOrder(BTNode *b)
{
    if (b != NULL)
    {
        InOrder(b->lchild);
        printf(" %c", b->data);
        InOrder(b->rchild);
    }
}

void InOrder1(BTNode *b)
{
    BTNode *St[MaxSize], *p;
    int top = -1;
    if (b != NULL)
    {
        p = b;
        while (p != NULL || top > -1)
        {
            while (p != NULL)
            {
                top++;
                St[top] = p;
                p = p->lchild;
            }
            if (top > -1)
            {
                p = St[top];
                top--;
                printf("%c ", p->data);
                p = p->rchild;
            }
        }
        printf("\n");
    }
}

void PostOrder(BTNode *b)
{
    if (b != NULL)
    {
        PostOrder(b->lchild);
        PostOrder(b->rchild);
        printf(" %c", b->data);
    }
}

void PostOrder1(BTNode *b)
{
    BTNode *St[MaxSize], *p;
    int top = -1;
    bool flag;
    if (b != NULL)
    {
        do
        {
            while (b != NULL)
            {
                top++;
                St[top] = b;
                b = b->lchild;
            }
            p = NULL;
            flag = true;
            while (top != -1 && flag)
            {
                b = St[top];
                if (b->rchild == p)
                {
                    printf("%c ", b->data);
                    top--;
                    p = b;
                }
                else
                {
                    b = b->rchild;
                    flag = false;
                }
            }
        } while (top > -1);
        printf("\n");
    }
}


void TravLevel(BTNode *b)
{
    BTNode *Qu[MaxSize];
    int front = 0, rear = 0;
    if(b!=NULL)printf("%c ",b->data);
    rear++;
    Qu[rear] = b;
    while(front!=rear)
    {
        front=(front+1)%MaxSize;
        b=Qu[front];
        if(b->lchild!=NULL)
        {
            printf("%c ",b->lchild->data);
            rear=(rear+1)%MaxSize;
            Qu[rear]=b->lchild;
        }
        if(b->rchild!=NULL)
        {
            printf("%c ",b->rchild->data);
            rear=(rear+1)%MaxSize;
            Qu[rear]=b->rchild;
        }
    }
    printf("\n");
}

int main(){
    BTNode *b;
    CreateBTree(b,(char*)"A(B(D,E(H(J,K(L,M(,N))))),C(F,G(,I)))");
    printf("二叉树b:");DispBTree(b);printf("\n");
    printf("层次遍历:");TravLevel(b);
    printf("先序遍历:\n");
    printf("递归算法:");PreOrder(b);printf("\n");
    printf("非递归算法:");PreOrder1(b);
    printf("中序遍历:\n");
    printf("递归算法:");InOrder(b);printf("\n");
    printf("非递归算法:");InOrder1(b);
    printf("后序遍历:\n");
    printf("递归算法:");PostOrder(b);printf("\n");
    printf("非递归算法:");PostOrder1(b);
    return 0;

}