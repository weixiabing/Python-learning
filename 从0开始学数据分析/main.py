a='Hello_Python_!!!'
#a转换成列表
b=list(a)
#列表b中的每个元素都大小写转换
for i in range(len(b)):
    if b[i].isupper():
        b[i]=b[i].lower()
    else:
        b[i]=b[i].upper()
#列表b转换成字符串
c=''.join(b)
print(c)
