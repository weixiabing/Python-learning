#include <stdio.h>
int main ()
{
void merge(int a[], int i, int mid, int j)
{
    int temp[100];
    int m = i, n = mid + 1, k = 0;
    while (m <= mid && n <= j)
    {
        if (a[m] <= a[n])
            temp[k++] = a[m++];
        else
            temp[k++] = a[n++];
    }
    while (m <= mid)
        temp[k++] = a[m++];
    while (n <= j)
        temp[k++] = a[n++];
    for (m = 0; m < k; m++)
        a[i + m] = temp[m];
}
void mergesort(int a[], int i, int j)
{
    int mid;
    if (i < j)
    {
        mid = (i + j) / 2;
        mergesort(a, i, j);
        mergesort(a, i + 1, j);
        merge(a, i, mid, j);
    }
}
int a[100], n, i;
printf("请输入数组的长度：");
scanf("%d", &n);
printf("请输入数组的元素：");
for (i = 0; i < n; i++)
    scanf("%d", &a[i]);
mergesort(a, 0, n - 1);
printf("排序后的数组为：");
for (i = 0; i < n; i++)
    printf("%d ", a[i]);
printf("       ");
return 0;




}