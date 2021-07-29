import xlrd
import xlwt
import numpy as np
from xlrd import sheet
sheetnum=int(input('请输入要计算的是第几张sheet（Excel左下角查看）的数字（从0开始）：'))
down=int(input('请输入筛选范围下限:'))
up=int(input('请输入筛选范围上限:'))
v = locals()
data = xlrd.open_workbook('/root/vsc/Python-learning/vsc/拟合/shuju.xlsx') # 打开xlsx文件
table = data.sheets()[sheetnum]
nrows = table.nrows  
ncols=table.ncols#读取行列

for i in range(ncols):#生成y列表
    if i==0:x=[]
    else:exec( 'y%s = []' % i)
         
for i in range(nrows): #写入数据
    x.append(float(table.row_values(i)[0:1][0]))
    for j in range(ncols-1):
       v['y'+ str(j+1)].append(float(table.row_values(i)[j+1:j+2][0]))
for j in range(ncols-1):
    v['f'+ str(j+1)] = np.polyfit(x, v['y'+ str(j+1)], 10)
    v['p'+ str(j+1)] = np.poly1d(v['f'+ str(j+1)])
    v['q'+ str(j+1)] = np.polyder( v['p'+ str(j+1)] )#求导
    v['xs'+ str(j+1)]= np.roots( v['q'+ str(j+1)]) #求根
    v['xsn'+ str(j+1)]=[round(float(n),4) for n in v['xs'+ str(j+1)] if down<n< up]


#写入
#创建workbook和sheet对象
workbook = xlwt.Workbook() #注意Workbook的开头W要大写
sheet1 = workbook.add_sheet('sheet1',cell_overwrite_ok=True)
for i in range(ncols-1):
    #向sheet页中写入数据
    for j in range(len(v['xsn'+ str(i+1)])):
        sheet1.write(j,i,v['xsn'+ str(i+1)][j])
workbook.save('result.xls')