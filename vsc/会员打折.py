a1=int(input("商品总价格为"))
a2=input("是否为会员,y/n:")
if a2=='y':
    if a1>=200:
       print("打八折后的价格为",a1*0.8)
    elif a1>=100:
       print("打9折后的价格为",a1*0.9) 
    else:
       print("不打折，价格为",a1)


    if a1>=200:
       print("打95折后的价格为",a1*0.95)
    else:
       print("不打折，价格为",a1)   