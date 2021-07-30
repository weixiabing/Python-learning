class Student:
    company='stx'

    @staticmethod
    def add(a,b):
        print('{0}+{1}={2}'.format(a,b,a+b))
        return a+b
Student.add(20,30)