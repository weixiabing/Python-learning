//定义顺序存储结构的二叉树
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#define MAX_SIZE 500
using namespace std;
//初始化二叉树
void EmptyTree(char Tree[])
{
    for(int i=1;i<MAX_SIZE;i++)
    {
        Tree[i]=0;
    }
}
//给i节点赋值操作
int setNode(char Tree[],int i,char x)
{
    if(Tree == NULL) {printf("二叉树为空"); return 0;}
    if(i>=MAX_SIZE) {printf("超出数组范围");return 0;}
    Tree[i]=x;
    return 1;
}
//给i节点的左孩子设置值
int setLeftChild(char Tree[],int i,char x)
{
    if(Tree == NULL) {printf("二叉树为空"); return 0;}
    if(i*2 >= MAX_SIZE) {printf("超出数组范围");return 0;}
    Tree[i*2]=x;
    return 1;
}
//给i节点的右孩子设置值
int setRightChild(char Tree[],int i,char x)
{
    if(Tree == NULL) {printf("二叉树为空"); return 0;}
    if(i*2+1 >= MAX_SIZE) {printf("超出数组范围");return 0;}
    Tree[i*2+1]=x;
    return 1;
}
//打印二叉树
void printTree(char Tree[])
{
    for(int i=1;i<MAX_SIZE;i++)
    {
		if(Tree[i]!=0)
		{
			printf("%c",Tree[i]);
		}
	}
}
//已知一棵二叉树按顺序存储结构进行存储，设计一个算法，求编号为i和j的两个节点的最近的公共祖先节点的值
char findParent(char Tree[],int i,int j)
{
	if(Tree == NULL) {printf("二叉树为空"); return 0;}
	if(i>=MAX_SIZE || j>=MAX_SIZE) {printf("超出数组范围");return 0;}
	if(Tree[i]==0 || Tree[j]==0) {printf("节点不存在");return 0;}
	i/=2;j/=2;
	while(i!=j)
	{
		if(i>j) i/=2;
		else j/=2;
	}
	return Tree[i];
}
int main()
{
    char Tree[MAX_SIZE];
    EmptyTree(Tree);
	int i,j;
    setNode(Tree,1,'a');
    setLeftChild(Tree,1,'b');
    setRightChild(Tree,1,'c');
	setLeftChild(Tree,2,'d');
    setRightChild(Tree,2,'e');
	setLeftChild(Tree,3,'f');
	setRightChild(Tree,3,'g');
	setLeftChild(Tree,5,'h');
	setRightChild(Tree,7,'i');
	setLeftChild(Tree,10,'j');
	setRightChild(Tree,10,'k');
	setLeftChild(Tree,21,'l');
	setRightChild(Tree,21,'m');
	setRightChild(Tree,43,'n');
	
    printTree(Tree);
	//printf("%c",Tree[21]);
	printf("\n");
	scanf("%d %d",&i,&j);
	printf("%c\n",findParent(Tree,i,j));
	return 0;
}
 