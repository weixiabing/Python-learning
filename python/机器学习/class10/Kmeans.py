# %%
import numpy as np
from PIL import Image
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt

# %%
# 以二进制形式打开文件,获取图片的大小,将每个像素点的RGB颜色处理到0-1范围内并存入data矩阵
def loadData(filePath):
    f = open(filePath, 'rb')
    data = []
    img = Image.open(f)  # 以列表形式返回图片像素值
    m, n = img.size  # 获取图片的大小
    for i in range(m):
        for j in range(n):  # 将每个像素点的RGB颜色处理到0-1范围内并存入data矩阵
            x, y, z = img.getpixel((i, j))
            data.append([x/256.0, y/256.0, z/256.0])
    f.close()
    return np.array(data), m, n

# %%
imgData, row, col = loadData('tiger.jpg')
# print(imgData, row, col)
label = KMeans(n_clusters=4).fit_predict(imgData)
# 聚类获得每个像素所属的类别
label = label.reshape([row, col])  # 二维列表
# print(label)
pic_new = Image.new("L", (row, col))  # 创建一张新的灰度图保存聚类后的效果
for i in range(row):  # i，j为图片像素，例如 640*480.   根据所属类别向图片中添加灰度值
    for j in range(col):
        pic_new.putpixel((i, j), int(256/(label[i][j]+1)))
pic_new.save("result-tiger.jpg", "JPEG")



