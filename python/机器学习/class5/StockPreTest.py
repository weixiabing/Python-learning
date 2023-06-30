#1. 建立工程，导入 sklearn相关包
import pandas as pd  'pandas用来加载CSV数据的工具包'
import numpy as np  'numpy支持高级大量的维度数组与矩阵运算，此外也针对数组运算提供大量的数学函数库。 '
from sklearn import svm 'SVM算法'
from sklearn import model_selection '引入交叉验证法'

#2.数据加载 &&数据预处理
#read_csv的详细使用地址：http://pandas.pydata.org/pandas-docs/stable/generated/pandas.read_csv.html
#pd.read_csv(数据源,encoding=编码格式为gbk，parse_dates=第0列解析为日期，index_col=用作行索引的列编号）)

 
#DataFrame.sort_index(axis=0(按0列排),ascending=True（升序）,inplace=False（排序后是否覆盖原数据））data


#选取 5列数据作为特征：收盘价 列数据作为特征：收盘价 最高价 最低价 开盘价 成交量
#dayfeature：选取 150 天的数据
#featurenum：选取的 5个特征 *天数
#x：记录 150 天的 5个特征值
#y：记录涨或者 跌

 
for i in range(0,data.shape[0]-dayfeature):
   #将数据中的 “收盘价 ”“ 最高价 ”“最低价”“ 开盘价 ”“ 成交量 ”存入 x数

  
    #最后一列记录当天的开盘价
    
 
for i in range(0,data.shape[0]-dayfeature):
    #如果当天收盘价高于开盘价，用1代表涨，0代表跌


 
 #3.创建SVM，并进行交叉验证
     #调用SVM函数，并设置kernel参数，默认是rbf，其它：‘linear’‘poly’‘sigmoid’


    #x和y的验证集 和测试，切分为8:2的测试集

 
    #训练数据进行训练


    #将预测数据和测试集的验证数据做对比


print("SVM分类的正确率（每次交叉验证的结果）为:")
print(result)
