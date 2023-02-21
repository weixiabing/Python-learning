#include <stdio.h>
#include <malloc.h>
#define INF 32767
#define MAXV 100
typedef char InfoType;
//以下定义邻接矩阵类型
typedef struct
{
    int no;
    InfoType info;
} VertexType;
typedef struct
{
    int edges[MAXV][MAXV];
    int n, e;
    VertexType vexs[MAXV];
} MatGraph;
typedef struct ANode
{
    int adjvex;
    struct ANode *nextarc;
    //指向下一条边的指针
    int weight;
    //该边的相关信息，如权值(用整型表示)
} ArcNode;
//边结点类型
typedef struct Vnode
{
    InfoType info;
    //顶点其他信息
    int count;
    //存放顶点人度，仅仅用于拓扑排序
    ArcNode *firstarc;
    //指向第一条边
} VNode;
//邻接表头结点类型
typedef struct
{
    VNode adjlist[MAXV];
    //邻接表头结点数组
    int n, e;
    //图中顶点数n和边数e
} AdjGraph;
//完整的图邻接表类型
//----邻接矩阵的基本运算算法
void CreateMat(MatGraph &g, int A[MAXV][MAXV], int n, int e)
{ //创建图的邻接矩阵
    int i, j;
    g.n = n;
    g.e = e;
    for (i = 0; i < g.n; i++)
        for (j = 0; j < g.n; j++)
            g.edges[i][j] = A[i][j];
}
void DispMat(MatGraph g)
{ //输出邻接矩阵g
    int i, j;
    for (i = 0; i < g.n; i++)
    {
        for (j = 0; j < g.n; j++)
            if (g.edges[i][j] != INF)
                printf("%2d", g.edges[i][j]);
            else
                printf("%4s", "∞");
        printf("\n");
    }
}
//----邻接表的基本运算算法
void CreateAdj(AdjGraph *&G, int A[MAXV][MAXV], int n, int e) //创建 图的邻接表
{
    int i, j;
    ArcNode *p;
    G = (AdjGraph *)malloc(sizeof(AdjGraph));
    for (i = 0; i < n; i++)
        //给邻接表中所有头结点的指针域置初值
        G->adjlist[i].firstarc = NULL;
    for (i = 0; i < n; i++)
        //检查邻接矩阵中的每个元素
        for (j = n - 1; j >= 0; j--)
            if (A[i][j] != 0 && A[i][j] != INF)
            //存在一条边
            {
                p = (ArcNode *)malloc(sizeof(ArcNode));
                //创建一个结点P
                p->adjvex = j;
                p->weight = A[i][j];
                p->nextarc = G->adjlist[i].firstarc;
                //采用头插法插人结点P
                G->adjlist[i].firstarc = p;
            }
    G->n = n;
    G->e = n;
}
void DispAdj(AdjGraph *G)
//输出邻接表G
{
    ArcNode *p;
    for (int i = 0; i < G->n; i++)
    {
        p = G->adjlist[i].firstarc;
        printf("%3d: ", i);
        while (p != NULL)
        {
            printf("%3d[%d]->", p->adjvex, p->weight);
            p = p->nextarc;
        }
        printf("^\n");
    }
}
void DestroyAdj(AdjGraph *&G) //销毁图的邻接表
{
    ArcNode *pre, *p;
    for (int i = 0; i < G->n; i++)
    //扫描所有的单链表
    {
        pre = G->adjlist[i].firstarc;
        // p指向第i个单链表的首结点
        if (pre != NULL)
        {
            p = pre->nextarc;
            while (p != NULL)
            //释放第i个单链表的所有边结点
            {
                free(pre);
                pre = p;
                p = p->nextarc;
            }
            free(pre);
        }
    }
    free(G);
    //释放头结点数组
}