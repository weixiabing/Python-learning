#导入 numpy 库和 pandas 库



#从sklearn 库中导入预处理模块 Imputer
#导入自动生成训练集和测试的模块 train_test_split
#导入 预测结果评估模块 classification_report



#从 sklearn 库中依次导入三个分类器模块：：
#K近邻分类器 KNeighborsClassifier 、
#决策树分类器 DecisionTreeClassifier
#高斯朴素贝叶函 数GaussianNB 



 #编写数据导入函数， 设置传两个参分别是特征文件的列表 feature_paths 和标签 文件 的列表 label_paths 。
#定义 feature 数组变量，列数量和特征维度一致为 41 ；
#定义空的标签变量，列数与定义空的标签维度一致为 1。
def load_datasets(feature_paths, label_paths):

     
    for file in feature_paths:
        #使用 pandas 库的 read_table函数读取一个特征文件的内容，
        #其中指定分隔符为逗号、缺失值问且文件不包含表头行


       
        #使用SimpleImputer函数，通过设定strategy参数为‘mean’，使用平均值对缺失数据进行补全。
        #fit()函数用于训练预处理器，transform() 函数用于生成预处理结果。


       
        #将预处理后的数据加入 feature ，依次遍历完所有特征文件

       
     
    for file in label_paths:
        #遵循与处理特征文件相同的思想，我们首先使用pandas库的read_table函数读取一个标签文件的内容，其中指定分隔符为逗号且文件不包含表头行。


  
        #由于标签文件没有缺失值，所以直接将读取到的新数据加入label集合，依次遍历完所有标签文件，得到标签集合label。


      
   # 最后函数将特征集合feature与标签集合label返回。      

    return

 
if __name__ == '__main__':
    ''' 设置数据路径feature_paths和label_paths。 '''

 
  ''' 读入数据
      使用python的分片方法，将数据路径中的前4个值作为训练集，并作为参数传入load_dataset()函数中，得到训练集合的特征x_train，训练集的标签y_train。
    '''


  "  将最后一个值对应的数据作为测试集，送入load_dataset()函数中，得到测试集合的特征x_test，测试集的标签y_test"

   
    "使用train_test_split()函数，通过设置测试集比例test_size为0，将数据随机打乱，便于后续分类器的初始化和训练。"


 
     #使用默认参数创建K近邻分类器，并将训练集x_train和y_train送入fit()函数进行训练，训练后的分类器保存到变量knn中。

   
    print('Training done')
    #使用测试集x_test，进行分类器预测，得到分类结果answer_knn。

  
    print('Prediction done')

    # 同理，创建决策树分类器，并在测试集上预测


    # 同理，创建贝叶斯分类器，并在测试集上预测

 

     #使用classification_report函数对分类结果，
    #从精确率precision、召回率recall、f1值f1-score和支持度support四个维度进行衡量
    #分别对三个分类器的分类结果进行输出

