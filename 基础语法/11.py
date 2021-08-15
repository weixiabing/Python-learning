#最小公倍数和最大公约数
x=int(input('num1:'))
y=int(input('num2:'))
if x>y:
    x,y=y,x
for i in range(x,0,-1):
    if x%i==0 and y%i==0:
        print('{0}和{1}最大公约数{2}'.format(x,y,i))
        print('{0}和{1}最小公倍数{2}'.format(x,y,x*y/i))
    