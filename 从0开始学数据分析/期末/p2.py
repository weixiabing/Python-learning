def main():
    #读取dataset.txt文件
    with open('dataset.txt','r',encoding="UTF-8") as f:
        dataset=f.read()
    #将dataset转换为列表
    dataset=dataset.split('， ')
    temp=list()
    for i in dataset:
        temp.append(int(i))
    dataset=temp
    #计算文本数据长度
    length=len(dataset)
    print('文本数据长度为：',length)
    return(length,dataset)
   
#找dataset中的最大值和最小值
def search(dataset):
    dataset.sort()
    min=dataset[0]
    max=dataset[-1]
    print('最大值为：',max)
    print('最小值为：',min)
    return(min,max)
 #计算两个数的最大公约数
def common_divisor(minv,maxv):
    v=1
    for i in range(1,maxv):
        if maxv%i==0 and minv%i==0:
            v=i
    print('最大公约数为：',v)
    return v
        
#判断数据是否为素数
def prime(i):
    for j in range(2,i):
        if i%j==0:
            return False
    return True


if __name__ == '__main__':
    length,dataset=main()
    minv,maxv=search(dataset)
    i=common_divisor(minv,maxv)
    #判断i是否为素数
    if prime(i):
        str1=str(i)+'是素数'
        print(str1)
    else:
        str1=str(i)+'不是素数'
        print(str1)
    #数据写入
    with open('dataset.txt','a',encoding="UTF-8") as f:
        f.write('\n文本数据长度为： {}\n'.format(length))
        f.write('最大值为： {}\n'.format(maxv))
        f.write('最小值为： {}\n'.format(minv))
        f.write('最大公约数为： {}\n'.format(i))
        f.write(str1+'\n')
    f.close()
