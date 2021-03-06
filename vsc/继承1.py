class Stu:
    def __init__(self,name,age):
        self.name=name
        self.age=age
    def __str__(self) :
        return '我的名字{0}，{1}'.format(self.name,self.age)
stu=Stu('张三',20)
print(dir(stu))