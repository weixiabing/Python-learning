a=8
print('用户手机账户原有话费金额：',a)
a+=int(input('请输入充值金额:'))
print('当前可用余额为：',a)


a=int(input('请输入您当天行走的步数：'))
a*=28
print('今天共消耗的卡路里为%d(即%.1f千卡)' %(a,a/1000))


num=int(input('输入十进制数'))
print(bin(num))
print(oct(num))
print(hex(num))