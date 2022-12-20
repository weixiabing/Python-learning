
#include<stdio.h>
#include<malloc.h>
#define INF 32767	//定义无穷 
#define MAXV 100	//最大顶点个数 
typedef char InfoType;
//定义邻接矩阵类型 
typedef struct 
{   int no;					//顶点编号 
    InfoType info;			 //顶点信息 
}VertexType;				//顶点类型 
typedef struct
{   int edges[MAXV][MAXV];	//邻接矩阵数组 
    int n,e;				//顶点数、边数 
    VertexType vexs[MAXV];	//存放顶点信息 
}MatGraph;					//完整的图邻接矩阵类型
//定义邻接表类型 
typedef struct ANode
{   int adjvex;				//边邻接点编号 
    struct ANode *nextarc;	//指向下一条边 
    int weight;				//该边的相关信息 
}ArcNode;					//边结点类型 
typedef struct Vnode	
{   InfoType info;			//顶点其他信息 
    int count;				//存放顶点入度用于拓扑排序 
    ArcNode *firstarc;		//指向第一条边 
}VNode;						//邻接表头结点类型 
typedef struct
{   VNode adjlist[MAXV];	//邻接表头结点数组 
    int n,e;				//图中头结点数n和边数e 
}AdjGraph;					//完整的图邻接表类型 
//------邻接矩阵的基本运算算法 ---------- 
void CreateMat (MatGraph &g,int A[MAXV][MAXV],int n,int e)//创建 
{   int i,j;
    g.n=n;g.e=e;
    for(i=0;i<g.n;i++)
       for(j=0;j<g.n;j++)
          g.edges[i][j]=A[i][j];
}
void DispMat(MatGraph g)							//输出 
{   int i,j;
    for(i=0;i<g.n;i++)
    {   for(j=0;j<g.n;j++)
            if (g.edges[i][j]!=INF)
               printf("%4d",g.edges[i][j]);
            else
               printf("%4s"," ∞");
        printf("\n");
	}
}
//------邻接表的基本运算算法------- 
void CreateAdj(AdjGraph *&G,int A[MAXV][MAXV],int n,int e)//创建 
{   int i,j;
    ArcNode *p;
    G=(AdjGraph *)malloc(sizeof(AdjGraph));
    for(i=0;i<n;i++)
        G->adjlist[i].firstarc=NULL;
    for(i=0;i<n;i++)
        for(j=n-1;j>=0;j--)
            if(A[i][j]!=0&&A[i][j]!=INF)
            {   p=(ArcNode *)malloc(sizeof(ArcNode));
                p->adjvex=j;
                p->weight =A[i][j];
                p->nextarc =G->adjlist[i].firstarc;
                G->adjlist[i].firstarc=p;
			}
	G->n=n;G->e=n;
}
void DispAdj(AdjGraph *G)						//输出 
{   ArcNode *p;
    for(int i=0;i<G->n;i++)
    {   p=G->adjlist[i].firstarc;
        printf("%3d:",i);
        while (p!=NULL)
        {   printf("%3d[%d]→",p->adjvex ,p->weight );
            p=p->nextarc;
		}
		printf("^\n");
	}
}
void DestroyAdj(AdjGraph *&G)			//销毁 
{   ArcNode *pre,*p;
    for(int i=0;i<G->n;i++)
    {   pre=G->adjlist[i].firstarc ;
        if(pre!=NULL)
        {   p=pre->nextarc ;
            while (p!=NULL)
            {   free(pre);
                pre=p;p=p->nextarc ;
			}
			free(pre);
		}
	}
	free(G);
}

int main()
{MatGraph g;
AdjGraph * G;
int A[MAXV][MAXV]={
{0, 5,INF, 7, INF, INF}, {INF, 0,4, INF, INF, INF},
{8, INF, 0, INF, INF, 9},{INF,INF, 5,0,INF, 6},
{INF, INF, INF, 5, 0, INF}, {3, INF, INF, INF, 1,0}};
int n=6,e=10; 
CreateMat(g,A,n,e);
printf("(1)图G的邻接矩阵：\n");DispMat(g);
CreateAdj(G,A,n,e);
printf("(2)图G的邻接表：\n");DispAdj(G);
printf("(3)销毁图G的邻接表\n");
DestroyAdj(G);
return 1;
}
