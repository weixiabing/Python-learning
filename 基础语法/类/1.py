class Student:
    company='SXT' #类属性
    count=0
    def __init__(self,name,score):
        self.name=name
        self.score=score
        Student.count+=1
    
    def say_score(self):
        print('我的公司是：',Student.company,end='\t')
        print(self.name,'的分数是：',self.score)
a1=Student('li',18)
a1.say_score()