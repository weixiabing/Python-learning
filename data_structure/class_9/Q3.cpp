#include "travsal.cpp"

int main(){
    AdjGraph *G;
    int A[MAXV][MAXV] = {
        {0, 5, INF,7, INF,INF},
        {INF, 0,4, INF, INF, INF},
        {8, INF, 0, INF, INF, 9},
        {INF, INF, 5, 0,INF,6},
        {INF, INF,INF, 5, 0, INF},
        {3, INF, INF, INF,1 ,0},
       };
    int n = 6, e = 10;
    CreateAdj(G,A, n, e);
   //用广度优先遍历的方法，找出顶点4到顶点1的路径并输出该路径
    printf("深度优先(递归)遍历顶点4到顶点1的路径序列为：\n");
    BFS(G, 4);
    DestroyAdj(G);
    return 0;

}