from bs4 import BeautifulSoup
import requests
if __name__=='__main__':
 target='https://www.biquge.cn/book/34387/17367511.html'
 req=requests.get(url=target)
 html=req.content
 html_doc=str(html,'gbk')
 bf=BeautifulSoup(html_doc)
 texts=bf.find_all('div',id="content")
 print(texts[0].text)

