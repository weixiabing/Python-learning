n=input('输入学生数:')
list1={}
for _ in range(int(n)):
    a=input('学生姓名：')
    list1[a]=input('请输入学生成绩')
   

print(list( list1.values()))
print