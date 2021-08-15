#斐波那契数列
a=1
b=1
temp=1
list=[1,1]
while a<10000:
    temp=a
    a+=b
    list.append(a)
    b=temp
print(list)

