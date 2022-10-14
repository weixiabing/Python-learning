#include "linklist.cpp"
int main()
{
	LinkNode* L, *L1, *L2;
	L = L1 = L2 = NULL;
	int n = 8;
	ElemType a[8] = { 'a','A','b','B','c','C','d','D'};
	CreateListR(L, a, n);
	printf("L: ");
	DispList(L);
	ElemType a1[n / 2], a2[n / 2];
	LinkNode* p = L->next;
	int k = 0;
	while (p != NULL)
	{
		int j = k % 2;
		if (j == 0)
		{
			a1[k/2] = p->data;
		}
		else
		{
			a2[k / 2] = p->data;
		}
		k++;
		p = p->next;
	}
	CreateListR(L1, a1, n / 2);
	CreateListF(L2, a2, n / 2);
	printf("L2:");
	DispList(L1);
	printf("L1:");
	DispList(L2);
}
