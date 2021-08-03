money = 0
acount_logs = []
class Account:
    a=True
   
    def __init__(self):
        self.money=money
        self.acount_logs =acount_logs#记录转入支出 0为支出 1为转入
    def deposit(self): 
        amount = float(input('存入金额：'))
        self.money += amount  
        acount_logs.append(amount)
    def withdrawl(self):
        amount = float(input('取出金额：'))
        if amount > self.money:
            print('余额不足')
        else:
            self.money += amount
            acount_logs.append(amount)
    def write_log(self):
        yue=0
        for i in acount_logs:
            
            yue+=i
            print('摘要:','转入' if i>0 else '支出',end='\t')
            print('金额:',i,end='\t')
            print('余额:',yue)
            
acc1=Account() 
a=1
print('====================银行账户资金交易管理====================\n0:退出\n1:存款\n2:取款\n3:打印交易详情\n===========================================================')
    
while(a==1):
    choice=int(input('输入你的选择(0-3)：'))
    if(choice==0):
        a=0
        print('退出程序成功')
    if(choice==1):
        acc1.deposit()
    if(choice==2):
        acc1.withdrawl()
    if(choice==3):
        acc1.write_log()