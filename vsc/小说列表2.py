

from bs4 import BeautifulSoup
import requests
if __name__ == "__main__":
     server = 'http://www.biquge.cn/'
     target = 'https://www.biquge.cn/book/34387/'
     req = requests.get(url = target) 
     html = req.text
     div_bf = BeautifulSoup(html)
     div = div_bf.find_all('div', class_ = 'listmain')
     a_bf = BeautifulSoup(str(div[0]))
     a = a_bf.find_all('a')
     for each in a:
          print(each.string, server + each.get('href'))