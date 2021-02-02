from bs4 import BeautifulSoup
import requests
if __name__ == "__main__":
 target = 'https://www.biquge.cn/book/34387/'
 req = requests.get(url = target)
 html = req.content
 html_doc=str(html,'gbk')
 div_bf=BeautifulSoup(html_doc)
 div=div_bf.find_all('div',id='list')
 print(div[100000])