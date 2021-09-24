# -*- coding: utf-8 -*-
'''
Created on 2018年4月7日
@author: niu
'''
#Py之Crawler：利用beautifulsoup+find_all方法实现下载在线书架小说《星祖的电影世界》
#find_all方法的第一个参数是获取的标签名，第二个参数class_是标签的属性。
 
from bs4 import BeautifulSoup
import requests, sys
 
class downloader(object):
    def __init__(self):
        self.server = 'http://www.biqukan.com/'
        self.target = 'http://www.biqukan.com/50_50927/'
        self.names = []            #存放章节名
        self.urls = []            #存放章节链接
        self.nums = 0            #章节数
 
 
    def get_download_url(self): #获取下载链接
        req = requests.get(url = self.target)
        html = req.text
        div_bf = BeautifulSoup(html)  #利用beautifulsoup提取内容
        div = div_bf.find_all('div', class_ = 'listmain') #通过审查元素发现全书各个章节存放在了class属性为listmain的div标签下，各章之间差别就在于这些章节的【href】属性不一样，而且其属性正好对应着每一章节URL后半部分，那这样，我们就可以根据标签的href属性值获得每个章节的链接和名称了。
        a_bf = BeautifulSoup(str(div[0]))
        a = a_bf.find_all('a')  
        self.nums = len(a[14:])      #剔除不必要的章节，并统计章节数
        for each in a[14:]:
            self.names.append(each.string)
            self.urls.append(self.server + each.get('href')) #再接着提取章节名和章节文章
 
    def get_contents(self, target): #获取章节内容，target下载连接(string)，texts章节内容(string)
        req = requests.get(url = target)
        html = req.text
        bf = BeautifulSoup(html)
        texts = bf.find_all('div', class_ = 'showtxt') #观察不同标签发现class属性为showtxt的div标签只有一个！这个标签里面存放的内容，是我们需要的小说正文
        texts = texts[0].text.replace('\xa0'*8,'\n\n')  #replace方法，剔除空格，替换为回车进行分段。 在html中是用来表示空格的。replace(‘\xa0’*8,’\n\n’)就是去掉下图的八个空格符号，并用回车代替
        return texts
 
    def writer(self, name, path, text): #将爬取的文章内容写入文件
        write_flag = True
        with open(path, 'a', encoding='utf-8') as f: #当前路径下,小说保存名称(string)
            f.write(name + '\n')  #章节名称(string)
            f.writelines(text)  #章节内容(string)
            f.write('\n\n')
if __name__ == "__main__":
    dl = downloader()
    dl.get_download_url()
    print('《星祖的电影世界》开始下载：')
    '''for i in range(dl.nums):
        dl.writer(dl.names[i], '星祖的电影世界.txt', dl.get_contents(dl.urls[i]))
        sys.stdout.write("  已下载:%.3f%%" %  float(i/dl.nums) + '\r')
        sys.stdout.flush()
    print('《星祖的电影世界》下载完成')'''