class Student:
    native_place='浙江'
    def __init__(self,name,age):
        self.name=name
        self.age=age


    def eat(self):#实例方法 self必写
        print('学生'+stu1.name+'在吃饭')

#静态方法
    @staticmethod
    def method():
        print('1')
#类方法
    @classmethod
    def cm(cls):
        print('12')

stu1=Student('张三',20)
stu1.eat()
print(stu1.name,stu1.age)
Student.eat(stu1)
stu2=Student('李四',30)
stu2.gender='女'
print(stu2.gender)


def show():
    print('我是一函数')
stu=Student('jack',20)
stu.gender='男'
print(stu.name,stu.age,stu.gender)
stu.show=show
stu.show()