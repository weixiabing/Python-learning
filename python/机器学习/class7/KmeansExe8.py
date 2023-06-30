from sklearn.cluster import KMeans
import numpy as np

def loadData(filePath):
    retData = []
    retCityName = []
    with open(filePath, 'r') as file:
        for line in file.readlines():
            items = line.strip().split(",")
            retCityName.append(items[0])
            retData.append([float(item) for item in items[1:]])
    return retData, retCityName

if __name__ == '__main__':
    data, cityName = loadData('python/机器学习/class7/city.txt')
    km = KMeans(n_clusters=4)
    label = km.fit_predict(data)
    expenses = np.sum(km.cluster_centers_, axis=1)
    
    CityCluster = [[] for _ in range(4)]
    for i, name in enumerate(cityName):
        CityCluster[label[i]].append(name)
    
    for i in range(len(CityCluster)):
        print("Expenses: %.2f" % expenses[i])
        print(CityCluster[i])
