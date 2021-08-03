from datetime import datetime

class Medicine(object):
    def __init__(self, name, price,PD,Exp):
        self.name = name
        self.price=price
        self.PD=PD
        self.Exp=Exp
    def get_name(self):
        return self.name
    def get_GP(self):
        start = datetime.strptime(self.PD,'%Y-%m-%d')
        end=datetime.strptime(self.Exp,'%Y-%m-%d')
        GP=end-start
        return GP.days
    def is_expire(self):
        today=datetime.now()
        oldday=datetime.strptime(self.Exp,'%Y-%m-%d')
        if today>oldday:
            return True
        else:
            return  False

if __name__ == '__main__':
    medicineObj=Medicine('感冒胶囊',100,'2019-1-1','2019-3-1')
    print('name:',medicineObj.get_name())
    print('药品保质期为：',medicineObj.get_GP())
    print('药品是否过期：','药品过期' if medicineObj.is_expire() else '药品未过期')
