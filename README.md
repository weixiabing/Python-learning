# Python-learning
 <img src="https://i.giphy.com/media/LMt9638dO8dftAjtco/200.webp" width="100"><br><br>

## 说明
git克隆命令推荐使用：```git clone git@github.com:weixiabing/Python-learning.git```<br>
仅供学习参考使用，请于下载后的 24 小时内删除，本人不对使用过程中出现的任何问题负责
## 简介
Python的实战日记
## 目录
+ [jupyter](https://github.com/weixiabing/Python-learning/tree/main/jupyter)
+ [vsc](https://github.com/weixiabing/Python-learning/tree/main/vsc)
+ [基础语法](https://github.com/weixiabing/Python-learning/tree/main/%E5%9F%BA%E7%A1%80%E8%AF%AD%E6%B3%95)
+ [数据结构与算法](https://github.com/weixiabing/Python-learning/tree/main/%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84%E4%B8%8E%E7%AE%97%E6%B3%95)
## git更新日志
<details>
<summary>Click for git log更新日志</summary>

 ``` diff
---start---

更新时间:2021-08-08 11:47:51linux远程更新
commit e8e45912da93f3d8ddd5b5008b625d29d972e057
Author: “weixiabing” <weixiabing@hotmail.com>
Date:   Sun Aug 8 11:47:07 2021 +0800

    1

diff --git a/Pipfile b/Pipfile
index ef3021d..fd4178d 100644
--- a/Pipfile
+++ b/Pipfile
@@ -4,7 +4,7 @@ url = "https://pypi.org/simple"
 verify_ssl = true
 
 [scripts]
-build = "cd auto-get&python main1.py"
+build = "python main1.py"
 
 [dev-packages]
 
diff --git a/auto-get/log.txt b/auto-get/log.txt
deleted file mode 100644
index 9f33b4a..0000000
--- a/auto-get/log.txt
+++ /dev/null
@@ -1,137 +0,0 @@
-commit 4aab921dc10fd71ec0ddb2771515e4a14634b29b
-Author: “weixiabing” <weixiabing@hotmail.com>
-Date:   Sun Aug 8 11:21:19 2021 +0800
-
-    1
-
-diff --git a/main1.py b/main1.py
-index a93111b..ec37a9e 100644
---- a/main1.py
-+++ b/main1.py
-@@ -40,7 +40,7 @@ def get_link_info():
-             print(num)
-             id = item.find('td', class_="td-01 ranktop").get_text()
-             print(id)
--            f.write('| '+id+'	|'+title+"	|"+num+'|<br>
 ')
-+            f.write('| '+id+'	|'+title+"	|"+num+'|
 ')
-     with open (os.path.join(os.getcwd(), "weibohotnews.txt"), 'r', encoding='utf-8') as f:
-         result = f.read()
-     return result
-@@ -66,7 +66,7 @@ def main():
-     # 替换 ---start--- 到 ---end--- 之间的内容
-     # pytz.timezone('Asia/Shanghai')).strftime('%Y年%m月%d日%H时M分')
-     fmt = '%Y-%m-%d %H:%M:%S %Z%z'
--    insert_info = "---开始---

" + "更新时间:"+  datetime.fromtimestamp(int(time.time()),pytz.timezone('Asia/Shanghai')).strftime('%Y-%m-%d %H:%M:%S')+"github action更新<br>
" + v2fy_info + "
---结束---"
-+    insert_info = "---开始---

" + "更新时间:"+  datetime.fromtimestamp(int(time.time()),pytz.timezone('Asia/Shanghai')).strftime('%Y-%m-%d %H:%M:%S')+"github action更新<br>
" +'|  序号   | 关键字  |热度|
|  ----  | ----  |----|
'+ v2fy_info + "
---结束---"
-     # 获取README.md内容
-     with open (os.path.join(os.getcwd(), "README.md"), 'r', encoding='utf-8') as f:
-         readme_md_content = f.read()
-diff --git a/weibohotnews.txt b/weibohotnews.txt
-index fe62896..139982e 100644
---- a/weibohotnews.txt
-+++ b/weibohotnews.txt
-@@ -1,51 +1,53 @@
--| 1	|美国总统拜登下令空袭塔利班	|4861669|<br>
-- | 2	|张勇阿里内网回应女员工被侵害	|3271718|<br>
-- | 3	|阿里回应女员工被侵害	|1680139|<br>
-- | 4	|阿里 破冰文化	|1678901|<br>
-- | 5	|Dina因裁判不公正丢失金牌后接受采访	|1632722|<br>
-- | 6	|陈思诚为佟丽娅庆生	|1631200|<br>
-- | 7	|艺术体操团体全能决赛	|1628832|<br>
-- | 8	|俄罗斯跳高冠军太优雅了	|1396575|<br>
-- | 9	|郑州已发现多起家庭聚集性感染	|1191385|<br>
-- | 10	|夫妻二人隐瞒扬州行程被罚	|1119076|<br>
-- | 11	|佟丽娅38岁状态	|1108410|<br>
-- | 12	|韩国男运动员获奖牌免兵役	|1090347|<br>
-- | 13	|曹格被狗咬伤	|957933|<br>
-- | 14	|东京奥运中国军团破纪录图鉴	|941614|<br>
-- | 15	|阿里巴巴	|907753|<br>
-- | 16	|马云	|900286|<br>
-- | 17	|张国伟只会说对对对的捧哏	|897409|<br>
-- | 18	|父亲做核酸检测巧遇驰援的儿子	|861309|<br>
-- | 19	|Lisa晒BLACKPINK合照庆出道五周年	|839106|<br>
-- | 20	|李荣浩为灵超放弃投票	|740523|<br>
-- | 21	|马龙人民日报撰文	|637273|<br>
-- | 22	|欧尼熊妈妈	|562219|<br>
-- | 23	|东京奥运会最后一个比赛日	|524136|<br>
-- | 24	|北京奥运会yyds	|511735|<br>
-- | 25	|蔡徐坤胡渣自拍	|510204|<br>
-- | 26	|安徽含山通报粗暴执法事件	|475991|<br>
-- | 27	|分手后又复合是怎样一种体验	|452225|<br>
-- | 28	|喝完秋天第一杯奶茶失眠了	|435481|<br>
-- | 29	|没想到国乒还能助眠	|424698|<br>
-- | 30	|起底德堡惊人黑幕	|399830|<br>
-- | 31	|江苏新增38例本土确诊病例	|386727|<br>
-- | 32	|德尔塔重新定义密接者	|316693|<br>
-- | 33	|河南新增24例本土确诊	|315798|<br>
-- | 34	|乔振宇25年前的美人尖	|311077|<br>
-- | 35	|熊敦瀚愿意为水球放弃美貌	|306562|<br>
-- | 36	|我的工作做得就像中国跳水队员	|250804|<br>
-- | 37	|世界看到了中国年轻人最好的样子	|243547|<br>
-- | 38	|开封7地调整为高风险	|243164|<br>
-- | 39	|赵文卓举千金致敬李发彬	|236571|<br>
-- | 40	|孙颖莎3秒不睡就算失眠	|215150|<br>
-- | 41	|对2008最好的回答	|214092|<br>
-- | 42	|南京市第19场疫情防控新闻发布会	|212066|<br>
-- | 43	|国风版奥运会	|210975|<br>
-- | 44	|原来奥运会结束还要写总结	|210801|<br>
-- | 45	|能让许昕闭嘴的人是李晓霞	|210701|<br>
-- | 46	|东京奥运会上的神仙解说词	|208379|<br>
-- | 47	|清理队一天捞出5吨垃圾	|206418|<br>
-- | 48	|网传武汉江夏阳性86个系谣言	|204049|<br>
-- | 49	|31省区市新增81例本土确诊	|203278|<br>
-- | 50	|杨绍辉创奥运会中国马拉松最佳排名	|201841|<br>
-+| 1	|美国总统拜登下令空袭塔利班	|4583316|
-+ | 2	|张勇阿里内网回应女员工被侵害	|3172144|
-+ | 3	|艺术体操团体全能决赛	|2264632|
-+ | •	|爱运动中国有安踏	||
-+ | 4	|阿里 破冰文化	|2232353|
-+ | 5	|Dina因裁判不公正丢失金牌后接受采访	|2161107|
-+ | 6	|郑州已发现多起家庭聚集性感染	|1377285|
-+ | •	|安踏 科技助力中国奥运	||
-+ | 7	|阿里回应女员工被侵害	|1374186|
-+ | 8	|原来奥运会结束还要写总结	|1352417|
-+ | 9	|佟丽娅38岁状态	|1314953|
-+ | 10	|阿里巴巴	|1141631|
-+ | 11	|俄罗斯跳高冠军太优雅了	|1123801|
-+ | 12	|夫妻二人隐瞒扬州行程被罚	|965926|
-+ | 13	|韩国男运动员获奖牌免兵役	|880823|
-+ | 14	|陈思诚为佟丽娅庆生	|877696|
-+ | 15	|东京奥运中国军团破纪录图鉴	|861901|
-+ | 16	|马云	|859957|
-+ | 17	|张国伟只会说对对对的捧哏	|846835|
-+ | 18	|曹格被狗咬伤	|800868|
-+ | 19	|Lisa晒BLACKPINK合照庆出道五周年	|769031|
-+ | 20	|李荣浩为灵超放弃投票	|690621|
-+ | 21	|父亲做核酸检测巧遇驰援的儿子	|624945|
-+ | 22	|北京奥运会yyds	|561725|
-+ | 23	|世界看到了中国年轻人最好的样子	|560033|
-+ | 24	|欧尼熊妈妈	|526653|
-+ | 25	|马龙人民日报撰文	|513831|
-+ | 26	|蔡徐坤胡渣自拍	|484658|
-+ | 27	|东京奥运会最后一个比赛日	|468208|
-+ | 28	|起底德堡惊人黑幕	|439003|
-+ | 29	|安徽含山通报粗暴执法事件	|422873|
-+ | 30	|分手后又复合是怎样一种体验	|416779|
-+ | 31	|喝完秋天第一杯奶茶失眠了	|393878|
-+ | 32	|没想到国乒还能助眠	|347342|
-+ | 33	|江苏新增38例本土确诊病例	|334490|
-+ | 34	|乔振宇25年前的美人尖	|288453|
-+ | 35	|熊敦瀚愿意为水球放弃美貌	|287951|
-+ | 36	|河南新增24例本土确诊	|257990|
-+ | 37	|德尔塔重新定义密接者	|257064|
-+ | 38	|我的工作做得就像中国跳水队员	|240009|
-+ | 39	|赵文卓举千金致敬李发彬	|224005|
-+ | 40	|开封7地调整为高风险	|221752|
-+ | 41	|南京新增2例确诊均在集中隔离点发现	|207511|
-+ | 42	|东京奥运会上的神仙解说词	|201144|
-+ | 43	|奥恰洛夫为了战胜马龙有多努力	|196558|
-+ | 44	|中国艺体演绎敦煌飞天	|195357|
-+ | 45	|对2008最好的回答	|194523|
-+ | 46	|印度得东京奥运第一枚金牌全国沸腾	|190918|
-+ | 47	|能让许昕闭嘴的人是李晓霞	|189704|
-+ | 48	|孙颖莎3秒不睡就算失眠	|187743|
-+ | 49	|清理队一天捞出5吨垃圾	|187410|
-+ | 50	|网传武汉江夏阳性86个系谣言	|185188|
-  
-\ No newline at end of file
diff --git a/auto-get/main.py b/auto-get/main.py
deleted file mode 100644
index 3b3daaa..0000000
--- a/auto-get/main.py
+++ /dev/null
@@ -1,48 +0,0 @@
-import time
-import os
-import re
-import pytz
-from datetime import datetime
-
-def get_link_info():
-
-    with open (os.path.join(os.getcwd(), "log.txt"), 'r', encoding='utf-8') as f:
-        result = f.read()
-    return result
-    
-
-
-
-
-
-
-
-
-def main():
-
-
-    
-    v2fy_info =  get_link_info()
-    print(v2fy_info)
-   
-
-     
-
-    # 替换 ---start--- 到 ---end--- 之间的内容
-    # pytz.timezone('Asia/Shanghai')).strftime('%Y年%m月%d日%H时M分')
-    fmt = '%Y-%m-%d %H:%M:%S %Z%z'
-    insert_info = "---start---

" + "更新时间:"+  datetime.fromtimestamp(int(time.time()),pytz.timezone('Asia/Shanghai')).strftime('%Y-%m-%d %H:%M:%S')+"linux远程更新
" + v2fy_info + "
---end---"
-    # 获取README.md内容
-    with open (os.path.join(os.getcwd(), "README.md"), 'r', encoding='utf-8') as f:
-        readme_md_content = f.read()
-
-    print(insert_info)
-
-    new_readme_md_content = re.sub(r'---start---(.|
)*---end---', insert_info, readme_md_content)
-
-    with open (os.path.join(os.getcwd(), "README.md"), 'w', encoding='utf-8') as f:
-        f.write(new_readme_md_content)
-
-
-
-main()
diff --git a/auto-get/main1.py b/auto-get/main1.py
deleted file mode 100644
index ec37a9e..0000000
--- a/auto-get/main1.py
+++ /dev/null
@@ -1,83 +0,0 @@
-import time
-import os
-import re
-import pytz
-from datetime import datetime
-import requests
-import json
-from lxml import html
-from bs4 import BeautifulSoup
-
-
-def get_link_info():
-    
-    #etree = html.etree
-    headers = {
-    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'
-    }
-    data = {
-    'cate': 'realtimehot'
-    }
-
-    try:
-        r = requests.get('http://s.weibo.com/top/summary?', params=data, headers=headers)
-        print(r.url)
-        if r.status_code == 200:
-            html = r.text
-    except:
-        html = ""
-
-    
-    f =open("weibohotnews.txt", "w", encoding='utf-8')
-    soup = BeautifulSoup(html,'lxml')
-    tr = soup.find(id='pl_top_realtimehot').find_all('tr', class_="")
-    for i, item in enumerate(tr):
-        if i > 0:
-        # print(item)
-            title = item.find('a').get_text()
-            print(title)
-            num = item.find('span').get_text()
-            print(num)
-            id = item.find('td', class_="td-01 ranktop").get_text()
-            print(id)
-            f.write('| '+id+'	|'+title+"	|"+num+'|
 ')
-    with open (os.path.join(os.getcwd(), "weibohotnews.txt"), 'r', encoding='utf-8') as f:
-        result = f.read()
-    return result
-    
-
-
-
-
-
-
-
-
-def main():
-
-
-    
-    v2fy_info =  get_link_info()
-    print(v2fy_info)
-   
-
-     
-
-    # 替换 ---start--- 到 ---end--- 之间的内容
-    # pytz.timezone('Asia/Shanghai')).strftime('%Y年%m月%d日%H时M分')
-    fmt = '%Y-%m-%d %H:%M:%S %Z%z'
-    insert_info = "---开始---

" + "更新时间:"+  datetime.fromtimestamp(int(time.time()),pytz.timezone('Asia/Shanghai')).strftime('%Y-%m-%d %H:%M:%S')+"github action更新<br>
" +'|  序号   | 关键字  |热度|
|  ----  | ----  |----|
'+ v2fy_info + "
---结束---"
-    # 获取README.md内容
-    with open (os.path.join(os.getcwd(), "README.md"), 'r', encoding='utf-8') as f:
-        readme_md_content = f.read()
-
-    print(insert_info)
-
-    new_readme_md_content = re.sub(r'---开始---(.|
)*---结束---', insert_info, readme_md_content)
-
-    with open (os.path.join(os.getcwd(), "README.md"), 'w', encoding='utf-8') as f:
-        f.write(new_readme_md_content)
-
-
-
-main()
diff --git a/auto-get/weibohotnews.txt b/auto-get/weibohotnews.txt
deleted file mode 100644
index 139982e..0000000
--- a/auto-get/weibohotnews.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-| 1	|美国总统拜登下令空袭塔利班	|4583316|
- | 2	|张勇阿里内网回应女员工被侵害	|3172144|
- | 3	|艺术体操团体全能决赛	|2264632|
- | •	|爱运动中国有安踏	||
- | 4	|阿里 破冰文化	|2232353|
- | 5	|Dina因裁判不公正丢失金牌后接受采访	|2161107|
- | 6	|郑州已发现多起家庭聚集性感染	|1377285|
- | •	|安踏 科技助力中国奥运	||
- | 7	|阿里回应女员工被侵害	|1374186|
- | 8	|原来奥运会结束还要写总结	|1352417|
- | 9	|佟丽娅38岁状态	|1314953|
- | 10	|阿里巴巴	|1141631|
- | 11	|俄罗斯跳高冠军太优雅了	|1123801|
- | 12	|夫妻二人隐瞒扬州行程被罚	|965926|
- | 13	|韩国男运动员获奖牌免兵役	|880823|
- | 14	|陈思诚为佟丽娅庆生	|877696|
- | 15	|东京奥运中国军团破纪录图鉴	|861901|
- | 16	|马云	|859957|
- | 17	|张国伟只会说对对对的捧哏	|846835|
- | 18	|曹格被狗咬伤	|800868|
- | 19	|Lisa晒BLACKPINK合照庆出道五周年	|769031|
- | 20	|李荣浩为灵超放弃投票	|690621|
- | 21	|父亲做核酸检测巧遇驰援的儿子	|624945|
- | 22	|北京奥运会yyds	|561725|
- | 23	|世界看到了中国年轻人最好的样子	|560033|
- | 24	|欧尼熊妈妈	|526653|
- | 25	|马龙人民日报撰文	|513831|
- | 26	|蔡徐坤胡渣自拍	|484658|
- | 27	|东京奥运会最后一个比赛日	|468208|
- | 28	|起底德堡惊人黑幕	|439003|
- | 29	|安徽含山通报粗暴执法事件	|422873|
- | 30	|分手后又复合是怎样一种体验	|416779|
- | 31	|喝完秋天第一杯奶茶失眠了	|393878|
- | 32	|没想到国乒还能助眠	|347342|
- | 33	|江苏新增38例本土确诊病例	|334490|
- | 34	|乔振宇25年前的美人尖	|288453|
- | 35	|熊敦瀚愿意为水球放弃美貌	|287951|
- | 36	|河南新增24例本土确诊	|257990|
- | 37	|德尔塔重新定义密接者	|257064|
- | 38	|我的工作做得就像中国跳水队员	|240009|
- | 39	|赵文卓举千金致敬李发彬	|224005|
- | 40	|开封7地调整为高风险	|221752|
- | 41	|南京新增2例确诊均在集中隔离点发现	|207511|
- | 42	|东京奥运会上的神仙解说词	|201144|
- | 43	|奥恰洛夫为了战胜马龙有多努力	|196558|
- | 44	|中国艺体演绎敦煌飞天	|195357|
- | 45	|对2008最好的回答	|194523|
- | 46	|印度得东京奥运第一枚金牌全国沸腾	|190918|
- | 47	|能让许昕闭嘴的人是李晓霞	|189704|
- | 48	|孙颖莎3秒不睡就算失眠	|187743|
- | 49	|清理队一天捞出5吨垃圾	|187410|
- | 50	|网传武汉江夏阳性86个系谣言	|185188|
- 
\ No newline at end of file
diff --git a/log.txt b/log.txt
new file mode 100644
index 0000000..9f33b4a
--- /dev/null
+++ b/log.txt
@@ -0,0 +1,137 @@
+commit 4aab921dc10fd71ec0ddb2771515e4a14634b29b
+Author: “weixiabing” <weixiabing@hotmail.com>
+Date:   Sun Aug 8 11:21:19 2021 +0800
+
+    1
+
+diff --git a/main1.py b/main1.py
+index a93111b..ec37a9e 100644
+--- a/main1.py
++++ b/main1.py
+@@ -40,7 +40,7 @@ def get_link_info():
+             print(num)
+             id = item.find('td', class_="td-01 ranktop").get_text()
+             print(id)
+-            f.write('| '+id+'	|'+title+"	|"+num+'|<br>
 ')
++            f.write('| '+id+'	|'+title+"	|"+num+'|
 ')
+     with open (os.path.join(os.getcwd(), "weibohotnews.txt"), 'r', encoding='utf-8') as f:
+         result = f.read()
+     return result
+@@ -66,7 +66,7 @@ def main():
+     # 替换 ---start--- 到 ---end--- 之间的内容
+     # pytz.timezone('Asia/Shanghai')).strftime('%Y年%m月%d日%H时M分')
+     fmt = '%Y-%m-%d %H:%M:%S %Z%z'
+-    insert_info = "---开始---

" + "更新时间:"+  datetime.fromtimestamp(int(time.time()),pytz.timezone('Asia/Shanghai')).strftime('%Y-%m-%d %H:%M:%S')+"github action更新<br>
" + v2fy_info + "
---结束---"
++    insert_info = "---开始---

" + "更新时间:"+  datetime.fromtimestamp(int(time.time()),pytz.timezone('Asia/Shanghai')).strftime('%Y-%m-%d %H:%M:%S')+"github action更新<br>
" +'|  序号   | 关键字  |热度|
|  ----  | ----  |----|
'+ v2fy_info + "
---结束---"
+     # 获取README.md内容
+     with open (os.path.join(os.getcwd(), "README.md"), 'r', encoding='utf-8') as f:
+         readme_md_content = f.read()
+diff --git a/weibohotnews.txt b/weibohotnews.txt
+index fe62896..139982e 100644
+--- a/weibohotnews.txt
++++ b/weibohotnews.txt
+@@ -1,51 +1,53 @@
+-| 1	|美国总统拜登下令空袭塔利班	|4861669|<br>
+- | 2	|张勇阿里内网回应女员工被侵害	|3271718|<br>
+- | 3	|阿里回应女员工被侵害	|1680139|<br>
+- | 4	|阿里 破冰文化	|1678901|<br>
+- | 5	|Dina因裁判不公正丢失金牌后接受采访	|1632722|<br>
+- | 6	|陈思诚为佟丽娅庆生	|1631200|<br>
+- | 7	|艺术体操团体全能决赛	|1628832|<br>
+- | 8	|俄罗斯跳高冠军太优雅了	|1396575|<br>
+- | 9	|郑州已发现多起家庭聚集性感染	|1191385|<br>
+- | 10	|夫妻二人隐瞒扬州行程被罚	|1119076|<br>
+- | 11	|佟丽娅38岁状态	|1108410|<br>
+- | 12	|韩国男运动员获奖牌免兵役	|1090347|<br>
+- | 13	|曹格被狗咬伤	|957933|<br>
+- | 14	|东京奥运中国军团破纪录图鉴	|941614|<br>
+- | 15	|阿里巴巴	|907753|<br>
+- | 16	|马云	|900286|<br>
+- | 17	|张国伟只会说对对对的捧哏	|897409|<br>
+- | 18	|父亲做核酸检测巧遇驰援的儿子	|861309|<br>
+- | 19	|Lisa晒BLACKPINK合照庆出道五周年	|839106|<br>
+- | 20	|李荣浩为灵超放弃投票	|740523|<br>
+- | 21	|马龙人民日报撰文	|637273|<br>
+- | 22	|欧尼熊妈妈	|562219|<br>
+- | 23	|东京奥运会最后一个比赛日	|524136|<br>
+- | 24	|北京奥运会yyds	|511735|<br>
+- | 25	|蔡徐坤胡渣自拍	|510204|<br>
+- | 26	|安徽含山通报粗暴执法事件	|475991|<br>
+- | 27	|分手后又复合是怎样一种体验	|452225|<br>
+- | 28	|喝完秋天第一杯奶茶失眠了	|435481|<br>
+- | 29	|没想到国乒还能助眠	|424698|<br>
+- | 30	|起底德堡惊人黑幕	|399830|<br>
+- | 31	|江苏新增38例本土确诊病例	|386727|<br>
+- | 32	|德尔塔重新定义密接者	|316693|<br>
+- | 33	|河南新增24例本土确诊	|315798|<br>
+- | 34	|乔振宇25年前的美人尖	|311077|<br>
+- | 35	|熊敦瀚愿意为水球放弃美貌	|306562|<br>
+- | 36	|我的工作做得就像中国跳水队员	|250804|<br>
+- | 37	|世界看到了中国年轻人最好的样子	|243547|<br>
+- | 38	|开封7地调整为高风险	|243164|<br>
+- | 39	|赵文卓举千金致敬李发彬	|236571|<br>
+- | 40	|孙颖莎3秒不睡就算失眠	|215150|<br>
+- | 41	|对2008最好的回答	|214092|<br>
+- | 42	|南京市第19场疫情防控新闻发布会	|212066|<br>
+- | 43	|国风版奥运会	|210975|<br>
+- | 44	|原来奥运会结束还要写总结	|210801|<br>
+- | 45	|能让许昕闭嘴的人是李晓霞	|210701|<br>
+- | 46	|东京奥运会上的神仙解说词	|208379|<br>
+- | 47	|清理队一天捞出5吨垃圾	|206418|<br>
+- | 48	|网传武汉江夏阳性86个系谣言	|204049|<br>
+- | 49	|31省区市新增81例本土确诊	|203278|<br>
+- | 50	|杨绍辉创奥运会中国马拉松最佳排名	|201841|<br>
++| 1	|美国总统拜登下令空袭塔利班	|4583316|
++ | 2	|张勇阿里内网回应女员工被侵害	|3172144|
++ | 3	|艺术体操团体全能决赛	|2264632|
++ | •	|爱运动中国有安踏	||
++ | 4	|阿里 破冰文化	|2232353|
++ | 5	|Dina因裁判不公正丢失金牌后接受采访	|2161107|
++ | 6	|郑州已发现多起家庭聚集性感染	|1377285|
++ | •	|安踏 科技助力中国奥运	||
++ | 7	|阿里回应女员工被侵害	|1374186|
++ | 8	|原来奥运会结束还要写总结	|1352417|
++ | 9	|佟丽娅38岁状态	|1314953|
++ | 10	|阿里巴巴	|1141631|
++ | 11	|俄罗斯跳高冠军太优雅了	|1123801|
++ | 12	|夫妻二人隐瞒扬州行程被罚	|965926|
++ | 13	|韩国男运动员获奖牌免兵役	|880823|
++ | 14	|陈思诚为佟丽娅庆生	|877696|
++ | 15	|东京奥运中国军团破纪录图鉴	|861901|
++ | 16	|马云	|859957|
++ | 17	|张国伟只会说对对对的捧哏	|846835|
++ | 18	|曹格被狗咬伤	|800868|
++ | 19	|Lisa晒BLACKPINK合照庆出道五周年	|769031|
++ | 20	|李荣浩为灵超放弃投票	|690621|
++ | 21	|父亲做核酸检测巧遇驰援的儿子	|624945|
++ | 22	|北京奥运会yyds	|561725|
++ | 23	|世界看到了中国年轻人最好的样子	|560033|
++ | 24	|欧尼熊妈妈	|526653|
++ | 25	|马龙人民日报撰文	|513831|
++ | 26	|蔡徐坤胡渣自拍	|484658|
++ | 27	|东京奥运会最后一个比赛日	|468208|
++ | 28	|起底德堡惊人黑幕	|439003|
++ | 29	|安徽含山通报粗暴执法事件	|422873|
++ | 30	|分手后又复合是怎样一种体验	|416779|
++ | 31	|喝完秋天第一杯奶茶失眠了	|393878|
++ | 32	|没想到国乒还能助眠	|347342|
++ | 33	|江苏新增38例本土确诊病例	|334490|
++ | 34	|乔振宇25年前的美人尖	|288453|
++ | 35	|熊敦瀚愿意为水球放弃美貌	|287951|
++ | 36	|河南新增24例本土确诊	|257990|
++ | 37	|德尔塔重新定义密接者	|257064|
++ | 38	|我的工作做得就像中国跳水队员	|240009|
++ | 39	|赵文卓举千金致敬李发彬	|224005|
++ | 40	|开封7地调整为高风险	|221752|
++ | 41	|南京新增2例确诊均在集中隔离点发现	|207511|
++ | 42	|东京奥运会上的神仙解说词	|201144|
++ | 43	|奥恰洛夫为了战胜马龙有多努力	|196558|
++ | 44	|中国艺体演绎敦煌飞天	|195357|
++ | 45	|对2008最好的回答	|194523|
++ | 46	|印度得东京奥运第一枚金牌全国沸腾	|190918|
++ | 47	|能让许昕闭嘴的人是李晓霞	|189704|
++ | 48	|孙颖莎3秒不睡就算失眠	|187743|
++ | 49	|清理队一天捞出5吨垃圾	|187410|
++ | 50	|网传武汉江夏阳性86个系谣言	|185188|
+  
+\ No newline at end of file
diff --git a/main.py b/main.py
new file mode 100644
index 0000000..3b3daaa
--- /dev/null
+++ b/main.py
@@ -0,0 +1,48 @@
+import time
+import os
+import re
+import pytz
+from datetime import datetime
+
+def get_link_info():
+
+    with open (os.path.join(os.getcwd(), "log.txt"), 'r', encoding='utf-8') as f:
+        result = f.read()
+    return result
+    
+
+
+
+
+
+
+
+
+def main():
+
+
+    
+    v2fy_info =  get_link_info()
+    print(v2fy_info)
+   
+
+     
+
+    # 替换 ---start--- 到 ---end--- 之间的内容
+    # pytz.timezone('Asia/Shanghai')).strftime('%Y年%m月%d日%H时M分')
+    fmt = '%Y-%m-%d %H:%M:%S %Z%z'
+    insert_info = "---start---

" + "更新时间:"+  datetime.fromtimestamp(int(time.time()),pytz.timezone('Asia/Shanghai')).strftime('%Y-%m-%d %H:%M:%S')+"linux远程更新
" + v2fy_info + "
---end---"
+    # 获取README.md内容
+    with open (os.path.join(os.getcwd(), "README.md"), 'r', encoding='utf-8') as f:
+        readme_md_content = f.read()
+
+    print(insert_info)
+
+    new_readme_md_content = re.sub(r'---start---(.|
)*---end---', insert_info, readme_md_content)
+
+    with open (os.path.join(os.getcwd(), "README.md"), 'w', encoding='utf-8') as f:
+        f.write(new_readme_md_content)
+
+
+
+main()
diff --git a/main1.py b/main1.py
new file mode 100644
index 0000000..ec37a9e
--- /dev/null
+++ b/main1.py
@@ -0,0 +1,83 @@
+import time
+import os
+import re
+import pytz
+from datetime import datetime
+import requests
+import json
+from lxml import html
+from bs4 import BeautifulSoup
+
+
+def get_link_info():
+    
+    #etree = html.etree
+    headers = {
+    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'
+    }
+    data = {
+    'cate': 'realtimehot'
+    }
+
+    try:
+        r = requests.get('http://s.weibo.com/top/summary?', params=data, headers=headers)
+        print(r.url)
+        if r.status_code == 200:
+            html = r.text
+    except:
+        html = ""
+
+    
+    f =open("weibohotnews.txt", "w", encoding='utf-8')
+    soup = BeautifulSoup(html,'lxml')
+    tr = soup.find(id='pl_top_realtimehot').find_all('tr', class_="")
+    for i, item in enumerate(tr):
+        if i > 0:
+        # print(item)
+            title = item.find('a').get_text()
+            print(title)
+            num = item.find('span').get_text()
+            print(num)
+            id = item.find('td', class_="td-01 ranktop").get_text()
+            print(id)
+            f.write('| '+id+'	|'+title+"	|"+num+'|
 ')
+    with open (os.path.join(os.getcwd(), "weibohotnews.txt"), 'r', encoding='utf-8') as f:
+        result = f.read()
+    return result
+    
+
+
+
+
+
+
+
+
+def main():
+
+
+    
+    v2fy_info =  get_link_info()
+    print(v2fy_info)
+   
+
+     
+
+    # 替换 ---start--- 到 ---end--- 之间的内容
+    # pytz.timezone('Asia/Shanghai')).strftime('%Y年%m月%d日%H时M分')
+    fmt = '%Y-%m-%d %H:%M:%S %Z%z'
+    insert_info = "---开始---

" + "更新时间:"+  datetime.fromtimestamp(int(time.time()),pytz.timezone('Asia/Shanghai')).strftime('%Y-%m-%d %H:%M:%S')+"github action更新<br>
" +'|  序号   | 关键字  |热度|
|  ----  | ----  |----|
'+ v2fy_info + "
---结束---"
+    # 获取README.md内容
+    with open (os.path.join(os.getcwd(), "README.md"), 'r', encoding='utf-8') as f:
+        readme_md_content = f.read()
+
+    print(insert_info)
+
+    new_readme_md_content = re.sub(r'---开始---(.|
)*---结束---', insert_info, readme_md_content)
+
+    with open (os.path.join(os.getcwd(), "README.md"), 'w', encoding='utf-8') as f:
+        f.write(new_readme_md_content)
+
+
+
+main()
diff --git a/weibohotnews.txt b/weibohotnews.txt
new file mode 100644
index 0000000..139982e
--- /dev/null
+++ b/weibohotnews.txt
@@ -0,0 +1,53 @@
+| 1	|美国总统拜登下令空袭塔利班	|4583316|
+ | 2	|张勇阿里内网回应女员工被侵害	|3172144|
+ | 3	|艺术体操团体全能决赛	|2264632|
+ | •	|爱运动中国有安踏	||
+ | 4	|阿里 破冰文化	|2232353|
+ | 5	|Dina因裁判不公正丢失金牌后接受采访	|2161107|
+ | 6	|郑州已发现多起家庭聚集性感染	|1377285|
+ | •	|安踏 科技助力中国奥运	||
+ | 7	|阿里回应女员工被侵害	|1374186|
+ | 8	|原来奥运会结束还要写总结	|1352417|
+ | 9	|佟丽娅38岁状态	|1314953|
+ | 10	|阿里巴巴	|1141631|
+ | 11	|俄罗斯跳高冠军太优雅了	|1123801|
+ | 12	|夫妻二人隐瞒扬州行程被罚	|965926|
+ | 13	|韩国男运动员获奖牌免兵役	|880823|
+ | 14	|陈思诚为佟丽娅庆生	|877696|
+ | 15	|东京奥运中国军团破纪录图鉴	|861901|
+ | 16	|马云	|859957|
+ | 17	|张国伟只会说对对对的捧哏	|846835|
+ | 18	|曹格被狗咬伤	|800868|
+ | 19	|Lisa晒BLACKPINK合照庆出道五周年	|769031|
+ | 20	|李荣浩为灵超放弃投票	|690621|
+ | 21	|父亲做核酸检测巧遇驰援的儿子	|624945|
+ | 22	|北京奥运会yyds	|561725|
+ | 23	|世界看到了中国年轻人最好的样子	|560033|
+ | 24	|欧尼熊妈妈	|526653|
+ | 25	|马龙人民日报撰文	|513831|
+ | 26	|蔡徐坤胡渣自拍	|484658|
+ | 27	|东京奥运会最后一个比赛日	|468208|
+ | 28	|起底德堡惊人黑幕	|439003|
+ | 29	|安徽含山通报粗暴执法事件	|422873|
+ | 30	|分手后又复合是怎样一种体验	|416779|
+ | 31	|喝完秋天第一杯奶茶失眠了	|393878|
+ | 32	|没想到国乒还能助眠	|347342|
+ | 33	|江苏新增38例本土确诊病例	|334490|
+ | 34	|乔振宇25年前的美人尖	|288453|
+ | 35	|熊敦瀚愿意为水球放弃美貌	|287951|
+ | 36	|河南新增24例本土确诊	|257990|
+ | 37	|德尔塔重新定义密接者	|257064|
+ | 38	|我的工作做得就像中国跳水队员	|240009|
+ | 39	|赵文卓举千金致敬李发彬	|224005|
+ | 40	|开封7地调整为高风险	|221752|
+ | 41	|南京新增2例确诊均在集中隔离点发现	|207511|
+ | 42	|东京奥运会上的神仙解说词	|201144|
+ | 43	|奥恰洛夫为了战胜马龙有多努力	|196558|
+ | 44	|中国艺体演绎敦煌飞天	|195357|
+ | 45	|对2008最好的回答	|194523|
+ | 46	|印度得东京奥运第一枚金牌全国沸腾	|190918|
+ | 47	|能让许昕闭嘴的人是李晓霞	|189704|
+ | 48	|孙颖莎3秒不睡就算失眠	|187743|
+ | 49	|清理队一天捞出5吨垃圾	|187410|
+ | 50	|网传武汉江夏阳性86个系谣言	|185188|
+ 
\ No newline at end of file

---end---
 ```
 </p>
</details>

 ## 微博热点榜


<details>
<summary>Click for 微博热点榜</summary>

 ---开始---

更新时间:2021-08-08 11:29:10github action更新<br>
|  序号   | 关键字  |热度|
|  ----  | ----  |----|
| 1	|美国总统拜登下令空袭塔利班	|4490887|
 | 2	|张勇阿里内网回应女员工被侵害	|3182824|
 | 3	|艺术体操团体全能决赛	|2246277|
 | •	|爱运动中国有安踏	||
 | 4	|阿里 破冰文化	|2187464|
 | 5	|Dina因裁判不公正丢失金牌后接受采访	|2019788|
 | 6	|原来奥运会结束还要写总结	|1748842|
 | •	|安踏 科技助力中国奥运	||
 | 7	|郑州已发现多起家庭聚集性感染	|1301234|
 | 8	|阿里回应女员工被侵害	|1295036|
 | 9	|佟丽娅38岁状态	|1238680|
 | 10	|阿里巴巴	|1177651|
 | 11	|俄罗斯跳高冠军太优雅了	|956982|
 | 12	|夫妻二人隐瞒扬州行程被罚	|875576|
 | 13	|韩国男运动员获奖牌免兵役	|749290|
 | 14	|陈思诚为佟丽娅庆生	|748027|
 | 15	|世界看到了中国年轻人最好的样子	|734544|
 | 16	|马云	|734343|
 | 17	|奥恰洛夫为了战胜马龙有多努力	|713750|
 | 18	|张国伟只会说对对对的捧哏	|699579|
 | 19	|Lisa晒BLACKPINK合照庆出道五周年	|679136|
 | 20	|东京奥运中国军团破纪录图鉴	|674837|
 | 21	|李荣浩为灵超放弃投票	|660307|
 | 22	|曹格被狗咬伤	|653647|
 | 23	|北京奥运会yyds	|530369|
 | 24	|父亲做核酸检测巧遇驰援的儿子	|525350|
 | 25	|欧尼熊妈妈	|510632|
 | 26	|马龙人民日报撰文	|466149|
 | 27	|南京新增2例确诊均在集中隔离点发现	|460112|
 | 28	|蔡徐坤胡渣自拍	|454852|
 | 29	|东京奥运会最后一个比赛日	|444797|
 | 30	|起底德堡惊人黑幕	|425082|
 | 31	|分手后又复合是怎样一种体验	|395945|
 | 32	|安徽含山通报粗暴执法事件	|386897|
 | 33	|喝完秋天第一杯奶茶失眠了	|366638|
 | 34	|没想到国乒还能助眠	|325781|
 | 35	|江苏新增38例本土确诊病例	|307020|
 | 36	|中国艺体演绎敦煌飞天	|278031|
 | 37	|印度得东京奥运第一枚金牌全国沸腾	|272513|
 | 38	|乔振宇25年前的美人尖	|269633|
 | 39	|熊敦瀚愿意为水球放弃美貌	|267043|
 | 40	|德尔塔重新定义密接者	|242621|
 | 41	|我的工作做得就像中国跳水队员	|223374|
 | 42	|郑州新报告确诊病例系郑州六院医生	|214587|
 | 43	|扬州11个病例去过同一个核酸检测点	|208830|
 | 44	|赵文卓举千金致敬李发彬	|206774|
 | 45	|东京奥运会上的神仙解说词	|192113|
 | 46	|开封7地调整为高风险	|187893|
 | 47	|对2008最好的回答	|186856|
 | 48	|能让许昕闭嘴的人是李晓霞	|178164|
 | 49	|孙颖莎3秒不睡就算失眠	|177624|
 | 50	|清理队一天捞出5吨垃圾	|170422|
 
---结束---


</p>
</details>

