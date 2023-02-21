n=int(input("请输入一个正整数："))
for i in range(1,n+1):
    if n%i==0 :
        print(i,end=' ')
        