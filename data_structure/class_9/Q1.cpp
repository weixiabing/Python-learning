#include "graph.cpp"
int main()
{
    MatGraph g;
    AdjGraph *G;
    int A[MAXV][MAXV] = {{0, 5,INF,7,INF,INF}, {INF,0,4,INF,INF,INF},
                          {8,INF,0,INF,INF,9}, {INF,INF,5,0,INF,6}, 
                          {INF,INF,INF,5,0,INF},{3,INF,INF,INF,1,0}};
    int n = 6, e = 10;
    CreateMat(g, A, n, e);
    printf("邻接矩阵为:\n");
    DispMat(g);
    CreateAdj(G, A, n, e);
    printf("邻接表为:\n");
    DispAdj(G);
    DestroyAdj(G);
    return 0;

                         
}