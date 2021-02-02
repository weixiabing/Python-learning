#!/usr/bin/python
# -*- coding:utf-8 -*-

import requests  # 用来抓取网页的html源码
import random  # 取随机数
from bs4 import BeautifulSoup  # 用于代替正则式 取源码中相应标签中的内容
import sys
import time  # 时间相关操作


class downloader(object):
    def __init__(self):
        self.server = 'http://www.biquge.cn/'     #这里是笔趣阁的首页，不用修改
        self.target = 'https://www.biquge.cn/book/34387/'   #这里是你想要下载的具体的小说的网页链接，根据需要修改
        self.names = []  # 章节名
        self.urls = []  # 章节链接
        self.nums = 0  # 章节数

    """
    获取html文档内容
    """

    def get_content(self, url):
        # 设置headers是为了模拟浏览器访问 否则的话可能会被拒绝 可通过浏览器获取，这里不用修改
        header = {
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
            'Connection': 'keep-alive',
            'Accept-Encoding': 'gzip, deflate, br',
            'Accept-Language': 'zh-CN, zh',
            'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36'
        }

        # 设置一个超时时间 取随机数 是为了防止网站被认定为爬虫，不用修改
        timeout = random.choice(range(80, 180))

        while True:
            try:
                req = requests.get(url=url, headers=header, timeout=timeout)
                req.encoding = 'GBK'       #这里是网页的编码转换，根据网页的实际需要进行修改，经测试这个编码没有问题
                break
            except Exception as e:
                print('3', e)
                time.sleep(random.choice(range(5, 10)))
        return req.text

    """
    获取下载的章节目录
    """

    def get_download_catalogue(self, url):
        html = self.get_content(url)
        bf = BeautifulSoup(html, 'html.parser')
        texts = bf.find_all('div', {'class': 'listmain'})
        div = texts[0]
        a_s = div.find_all('a')
        self.nums = len(a_s[750:])  # 我们需要去掉不想下载的章节列表，笔趣阁是前面12个章节是重复的，可以修改这里的数值为#12，也可以根据自己想要下载的章节数进行修改，下面的也是一样，跟这里的数值保持一致即可。
        for each in a_s[750:]:
            self.names.append(each.string)
            self.urls.append(self.server + each.get('href'))

    """
    获取下载的具体章节
    """

    def get_download_content(self, url):
        #html = self.get_content(url)
        html = self.get_content(url)
        bf = BeautifulSoup(html, 'html.parser')
        texts = bf.find_all('div', {'class': 'showtxt', 'id': 'content'})
        text = texts[0].text.replace('\xa0' * 7, '\n\n')  # \xa0表示连续的空白格，去掉这些空格
        return text

    """
    将文章写入文件
    """

    def writer(self, name, path, text):
        write_flag = True
        with open(path, 'a', encoding='utf-8') as f:
            f.write(name + '\n')
            f.writelines(text)
            f.write('\n\n')


if __name__ == '__main__':
    dl = downloader()
    dl.get_download_catalogue(dl.target)
    for i in range(dl.nums):
        dl.writer(dl.names[i], '叶辰.txt', dl.get_download_content(dl.urls[i]))     #保存的文件名根据需要进行修改
        print("已下载：%.2f%%" % float((i + 1) / dl.nums * 100) + '\r')
    print('下载完成！')