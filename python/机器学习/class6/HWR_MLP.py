import numpy as np     #1.导入numpy工具包
from os import listdir #使用listdir模块，用于访问本地文件
from sklearn.neural_network import MLPClassifier 

  #2.加载训练数据
def img2vector(fileName):    
    #定义返回的矩阵，大小为1*1024，打开包含32*32大小的数字文件，读取文件的所有行
   #遍历文件所有行，并将01数字存放在retMat中    
    
          
 
def readDataSet(path):   
      #获取文件夹下的所有文件，统计需要读取的文件的数目
     #遍历所有的文件获取文件名称/路径；通过文件名获取标签，将对应的one-hot标签置1
         

 # 3.训练神经网络
#构建神经网络：
#设置网络的隐藏层数、各隐藏层神经元个数、激活函数、学习率、优化方法、最大迭代次数。

 
#4.测试集评价：对测试集进行预测，统计预测错误的数目
