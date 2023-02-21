class Emp:
    #工资
   
    def __init__(self,name,salary) -> None:
        self._name=name
        self._salary=salary
    def get_salary(self):
        return self._salary
    def set_salary(self,salary):
        if 1000<salary<50000:
            self._salary=salary
        else:
            print('录入错误')
emp1=Emp('hh',30000)
print(emp1._salary)
emp1.salary=-20000
#print(emp1.sa)