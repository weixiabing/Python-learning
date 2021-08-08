import time
import os
import re
import pytz
from datetime import datetime
import requests
import json
from lxml import html
from bs4 import BeautifulSoup


def get_link_info():
    
    #etree = html.etree
    headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'
    }
    data = {
    'cate': 'realtimehot'
    }

    try:
        r = requests.get('http://s.weibo.com/top/summary?', params=data, headers=headers)
        print(r.url)
        if r.status_code == 200:
            html = r.text
    except:
        html = ""

    
    f =open("weibohotnews.txt", "w", encoding='utf-8')
    soup = BeautifulSoup(html,'lxml')
    tr = soup.find(id='pl_top_realtimehot').find_all('tr', class_="")
    for i, item in enumerate(tr):
        if i > 0:
        # print(item)
            title = item.find('a').get_text()
            print(title)
            num = item.find('span').get_text()
            print(num)
            id = item.find('td', class_="td-01 ranktop").get_text()
            print(id)
            f.write(id+'\t'+title+"\t"+num+'\n')
    with open (os.path.join(os.getcwd(), "weibohotnews.txt"), 'r', encoding='utf-8') as f:
        result = f.read()
    return result
    








def main():


    
    v2fy_info =  get_link_info()
    print(v2fy_info)
   

     

    # 替换 ---start--- 到 ---end--- 之间的内容
    # pytz.timezone('Asia/Shanghai')).strftime('%Y年%m月%d日%H时M分')
    fmt = '%Y-%m-%d %H:%M:%S %Z%z'
    insert_info = "---开始---\n\n" + "更新时间:"+  datetime.fromtimestamp(int(time.time()),pytz.timezone('Asia/Shanghai')).strftime('%Y-%m-%d %H:%M:%S')+"linux远程更新\n" + v2fy_info + "\n---结束---"
    # 获取README.md内容
    with open (os.path.join(os.getcwd(), "README.md"), 'r', encoding='utf-8') as f:
        readme_md_content = f.read()

    print(insert_info)

    new_readme_md_content = re.sub(r'---开始---(.|\n)*---结束---', insert_info, readme_md_content)

    with open (os.path.join(os.getcwd(), "README.md"), 'w', encoding='utf-8') as f:
        f.write(new_readme_md_content)



main()
