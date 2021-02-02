from bs4 import BeautifulSoup
import requests
if __name__ == "__main__":
 server = 'http://www.biquge.cn/'
 target = 'https://www.biquge.cn/book/34387/'
 req = requests.get(url = target)
 html = req.content
 html_doc=str(html,'gbk')
 div_bf = BeautifulSoup(html_doc) # 创建一个BeautifulSoup对象
 div = div_bf.find_all('div', id='list')
 a_bf = BeautifulSoup(str(div[0]))
 a =a_bf.find_all('a')
 for each in a:
  print(each.string, server + each.get('href'))