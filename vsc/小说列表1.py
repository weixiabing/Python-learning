
from bs4 import BeautifulSoup
import requests
if __name__ == "__main__":
     target = 'https://www.biquge.cn/book/34387/'
     req = requests.get(url = target)
     html = req.text
     div_bf = BeautifulSoup(html)
     div = div_bf.find_all('div', class_ = 'listmain')
     print(div[0])