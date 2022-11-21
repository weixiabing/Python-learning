#include "btree.cpp"
int main(){
    BTNode *b,*p,*lp,*rp;;
    printf("二叉树的基本运算如下：\n");
    printf("1.建立二叉树\n");
    CreateBTree(b,(char*)"A(B(D,E(H(J,K(L,M(,N))))),C(F,G(,I)))");
    printf("2.输出二叉树\n");DispBTree(b);printf("\n");
    printf("3.H节点:");
    p=FindNode(b,'H');
    if(p!=NULL)
    {
        lp=LchildNode(p);
        if(lp!=NULL)printf("左孩子为%c",lp->data);
        else printf("无左孩子");
        rp=RchildNode(p);
        if(rp!=NULL)printf("右孩子为%c",rp->data);
        else printf("无右孩子");

    }
    printf("\n");
    printf("4.二叉树的高度为%d\n",BTHeight(b));
    printf("5.销毁二叉树\n");
    DestroyBTree(b);
    return 1;
}