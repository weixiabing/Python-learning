class Student:
    company='SXT' #类属性
    count=0
    def _init_(self,name,score):
        self.name=name
        self.score=score
        Student.count+=1
    
    def say_score(self):
        print('我的公司是：',Student.company)
        print(self.name,'的分数是：',self.score)

print(Student.say_score())