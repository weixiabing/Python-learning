'''pwd=input('支付密码：')
if pwd.isdigit():
    print('支付数据合法')
else:
    print('不合法')'''

#print('支付数据合法' if pwd.isdigit() else'支付数据不合法')#数字密码


import random
print('竞猜商品价格')
print('----------------------------')
print('今日竞猜商品为小米扫地机器人：价格在【1-100】')

b=random.randint(1,100)
a=int(input('please input a number：'))
while a!=b:
    if a>b:
        print('猜大了')
    else:
        print('猜小了')
    a=int(input('请重新输入：'))
print('恭喜你猜对了')


