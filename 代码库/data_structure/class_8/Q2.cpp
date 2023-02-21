#include "/workspaces/Python-learning/data_structure/class_6/btree.cpp"
//找出值最大的叶子节点的字符
void findMaxLeaf(BTNode *b, char &max)
{
    if (b == NULL)
        return;
    if (b->lchild == NULL && b->rchild == NULL)
    {
        if (b->data > max)
            max = b->data;
    }
    findMaxLeaf(b->lchild, max);
    findMaxLeaf(b->rchild, max);
}
int main(){
    BTNode *b;
    CreateBTree(b,(char*)"Z(B(E,Y(G,X)),C(,D(I,J(,K))))");
    char max = 'A';
    findMaxLeaf(b, max);
    printf("%c\n", max);
   
}   