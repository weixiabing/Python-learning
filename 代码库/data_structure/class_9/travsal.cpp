#include"graph.cpp"
int visited[MAXV];
void DFS(AdjGraph *G, int v)
{ //从顶点v出发深度优先遍历图g
    ArcNode *p;
    printf("%3d", v);visited[v]=1;
    p = G->adjlist[v].firstarc;
    while (p != NULL)
    {
        if (!visited[p->adjvex])
            DFS(G, p->adjvex);
        p = p->nextarc;
    }
}

void DFS1(AdjGraph *G, int v)
{ //从顶点v出发深度优先遍历图g
    ArcNode *p;
    int St[MAXV], top = -1,w,x,i;
    for (i = 0; i < G->n; i++)
        visited[i] = 0;
    printf("%3d", v);visited[v]=1;
    St[++top] = v;
    while (top != -1)
    {
        x = St[top];
        p = G->adjlist[x].firstarc;
        while (p != NULL)
        {
            w = p->adjvex;
            if (!visited[w])
            {
                printf("%3d", w);visited[w]=1;
                St[++top] = w;
                break;
            }
            p = p->nextarc;
        }
        if (p == NULL)
            top--;
    }
    printf("\n");
}

void BFS(AdjGraph *G, int v)
{ //从顶点v出发广度优先遍历图g
    ArcNode *p;
    int Q[MAXV], front = -1, rear = -1, w, i;
    for (i = 0; i < G->n; i++)
        visited[i] = 0;
    printf("%3d", v);visited[v]=1;
    Q[++rear] = v;
    while (front != rear)
    {
        w = Q[++front];
        p = G->adjlist[w].firstarc;
        while (p != NULL)
        {
            if (!visited[p->adjvex])
            {
                printf("%3d", p->adjvex);visited[p->adjvex]=1;
                Q[++rear] = p->adjvex;
            }
            p = p->nextarc;
        }
    }
    printf("\n");
}


  void BFS1(AdjGraph *G, int v,int h)
{ //从顶点v出发广度优先遍历图g
    ArcNode *p;
    int Q[MAXV], front = -1, rear = -1, w, i;
    for (i = 0; i < G->n; i++)
        visited[i] = 0;
    printf("%3d", v);visited[v]=1;
    Q[++rear] = v;
    while (front != rear)
    {
        w = Q[++front];
        p = G->adjlist[w].firstarc;
        while (p != NULL)
        {
            if (!visited[p->adjvex])
            {
                printf("%3d", p->adjvex);visited[p->adjvex]=1;
                Q[++rear] = p->adjvex;
                if(p->adjvex==h)
                    return;
            }
            p = p->nextarc;
        }
    }
    printf("\n");
}