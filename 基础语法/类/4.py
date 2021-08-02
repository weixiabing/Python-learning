<<<<<<< HEAD
class Test:
    def __init__(self,age):#init 自动运行 
        self.age=age
        print('my age is ',self.age)
    score=100
s1=Test(18)

=======
class Person:
    def __del__(self):
        print('销毁对象:{0}'.format(self))
p1=Person()
p2=Person()
del p2
print(p2)
>>>>>>> e6bd8921c42a93e06abdc5401d36ec92bdeee0b6
