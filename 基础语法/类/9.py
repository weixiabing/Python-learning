#coding: utf-8
import  time
import prettytable as pt
money = 0
acount_logs = []
class Account:
    def __init__(self):
        global  money
        self.money = money
        self.acount_logs = acount_logs
    def deposit(self):
        amount = float(input('存入金额：'))
        self.money += amount
        self.write_log(amount,'转入')
    def withdrawl(self):
        amount = float(input('取出金额：'))
        if amount > self.money:
            print('余额不足')
        else:
            self.money -= amount
            self.write_log(amount,'取出')
    def transaction_log(self):
        tb = pt.PrettyTable()
        tb.field_names = ["交易日期","摘要","金额","币种","余额"]
        for info in self.acount_logs:
            if info[1] =='转入':
                amount = '+{}'.format(info[2])
            else:
                amount = '-{}'.format(info[2])
            tb.add_row([info[0],info[1],amount,'人民币',info[3]])
            print(tb)
    def write_log(self,amout,handle):
        create_time = time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))
        data =[create_time,handle,amout,self.money]
        self.acount_logs.append(data)
def show_menu():
    """ 显示菜单栏 """
    menu = """
====================银行账户资金交易管理====================
0: 退出
1:存款
2: 取款
3: 打印交易详情
===========================================================
    """
    print(menu)
if __name__ == '__main__':
    show_menu()
    account = Account()
    while True:
        choice = int(input("请输入您的选择: "))
        if choice == 0:
            exit(0)
            print("退出系统")
        elif choice == 1:
            flag = True
            while flag:
                account.deposit()
                flag = True if input("是否继续存款(Y|N): ").lower()== 'y' else False
        elif choice == 2:
            flag = True
            while flag:
                account.withdrawl()
                flag = True if input("是否继续取款(Y|N): ").lower()== 'y' else False
        elif choice == 3:
            account.transaction_log()
        else:
            print("请选择正确的编号")

