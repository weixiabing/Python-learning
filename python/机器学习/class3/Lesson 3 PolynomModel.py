#1. 建立工程并导入 sklearn 包
 
 
#2.加载训练数据，建立回归方程
# 读取数据集,建立datasets_X和datasets_Y用来存储数据中的房屋尺寸和房屋成交价格。


#打开数据集所在文件prices.txt，读取数据。


#一次读取整个文件。


#逐行进行操作，循环遍历所有数据


    #去除数据文件中的逗号

    
    #将读取的数据转换为int型，并分别写入datasets_X和datasets_Y。


  
 
#求得datasets_X的长度，即为数据的总数。

 #将datasets_X转化为数组，并变为二维，以符合线性回归拟合函数输入参数要求。


#将datasets_Y转化为数组


#以数据datasets_X的最大值和最小值为范围，建立等差数列，方便后续画图。
 

 
#degree=2表示建立datasets_X的二次多项式特征X_poly。
#然后创建线性回归，使用线性模型学习X_poly和datasets_Y之间的映射关系（即参数）。


 
# 3.图像中显示，可视化处理
#用scatter函数绘制数据点，用红色绘制数据点；
#用plot函数来绘制直线，用蓝色绘制回归线；用xlabel和ylabel用来指定横纵坐标的名称。
