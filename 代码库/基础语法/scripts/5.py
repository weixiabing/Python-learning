#列表
print(list(range(3,-10,-1)))
a=[x*2 for x in range(2) if x !=0]
print(a)
b=[[1,2,2],[2,3,4],[4,5,6]]
for m in range(3):
    for n in range(3):
        print(b[m][n],end='\t')
    print()