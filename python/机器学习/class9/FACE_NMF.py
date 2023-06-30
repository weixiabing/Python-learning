from numpy.random import RandomState
import matplotlib.pyplot as plt
from sklearn.datasets import fetch_olivetti_faces
from sklearn import decomposition
 
 #定义图显示格式
n_row, n_col = 2, 3
n_components = n_row * n_col
image_shape = (64, 64)

# 载入数据
dataset = fetch_olivetti_faces(shuffle=True, random_state=RandomState(0))
faces = dataset.data
 
#定义画图命令
def plot_gallery(title, images, n_col=n_col, n_row=n_row):
    plt.figure(figsize=(2. * n_col, 2.26 * n_row)) 
    plt.suptitle(title, size=16)

 #显示库中6个面孔     
plot_gallery("First centered Olivetti faces", faces[:n_components])



#PCA和NMF降维处理 
estimators = [
    ('Eigenfaces - PCA using randomized SVD',
        decomposition.PCA(n_components=6,whiten=True)),

    ('Non-negative components - NMF',
     
        decomposition.NMF(n_components=6, init='nndsvda', tol=5e-3))
]





#将降维的特征可视化
for name, estimator in estimators:
    estimator.fit(faces)
    components_ = estimator.components_
    plot_gallery(name, components_[:n_components])

plt.show()

