from datetime import datetime
class Medicine:
    def __init__(self,pd,exp):
        self.pd=pd
        self.exp=exp
    def calcule(self):
        start= datetime.strptime(self.pd,'%Y.%m.%d')
        end= datetime.strptime(self.exp,'%Y.%m.%d')
        gp=end-start
        return gp.days
s1=Medicine('2001.02.1','2002.12.31')
print(s1.calcule())

        