b=1
def jiecheng(a):
  global b
  if a>1:
      b*=a
      a-=1
      jiecheng(a)
  elif a==1 : print(b)
  else:print('请输入正整数')

c=int(input('number='))
jiecheng(c)



def fun(n):
    if(n==1):
        return 1
    else:
        res=n*fun(n-1)
        return res
print(fun(input()))