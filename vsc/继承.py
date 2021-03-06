class Person(object):
    def __init__(self,name,age):
        self.name=name
        self.age=age
    def info(self):
        print('姓名：{0}，年龄：{1}'.format(self.name,self.age))

class Student(Person):
    def __init__(self, name, age,score):
        super().__init__(name, age)
        self.score=score
    def info(self):
        super().info()
        print(self.score)
class Teacher(Person):
    def __init__(self, name, age,ty):
        super().__init__(name, age)
        self.ty=ty 
    def info(self):
        return super().info()
        print(self.ty)
stu=Student('jace',20,'1001')
stu.info()