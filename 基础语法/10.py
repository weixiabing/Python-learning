num=int(input('please input a number:'))
num2=int(num**0.5)
prime=True
for i in range(2,num2+1):
    if num%i==0:
        prime=False
        break
if prime:
    print('{0}是素数'.format(num))
else:
    print('{0}不是素数'.format(num))
