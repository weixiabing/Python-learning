class SalaryAcount:
    #工资计算器
    def __call__(self, salary) :
        print('算工资')
        ys=salary*12
        ds=salary/22.5
        bs=ds//8

        return dict(ys=ys,ds=ds,hs=bs)
s=SalaryAcount()
print(s(30000))