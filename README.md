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

更新时间:2021-08-08 11:55:45github action更新<br>
|  序号   | 关键字  |热度|
|  ----  | ----  |----|
| 1	|阿里 破冰文化	|6587185|
 | 2	|美国总统拜登下令空袭塔利班	|2781263|
 | 3	|张勇阿里内网回应女员工被侵害	|2246388|
 | •	|为运动拼搏真牛	||
 | 4	|艺术体操团体全能决赛	|2177735|
 | 5	|Dina因裁判不公正丢失金牌后接受采访	|2118671|
 | 6	|货拉拉跳车事件司机妻子发声	|1749220|
 | 7	|原来奥运会结束还要写总结	|1697132|
 | 8	|佟丽娅38岁状态	|1122840|
 | 9	|郑州已发现多起家庭聚集性感染	|1066973|
 | 10	|阿里巴巴	|1053747|
 | 11	|阿里回应女员工被侵害	|1035103|
 | 12	|中国艺体演绎敦煌飞天	|1001642|
 | 13	|陈思诚为佟丽娅庆生	|973142|
 | 14	|扬州11个病例去过同一个核酸检测点	|944612|
 | 15	|33岁倪妮状态	|907138|
 | 16	|马云	|907007|
 | 17	|奥恰洛夫为了战胜马龙有多努力	|906273|
 | 18	|世界看到了中国年轻人最好的样子	|905245|
 | 19	|美国女篮vs日本女篮	|848955|
 | 20	|夫妻二人隐瞒扬州行程被罚	|780167|
 | 21	|印度得东京奥运第一枚金牌全国沸腾	|780026|
 | 22	|俄罗斯跳高冠军太优雅了	|729004|
 | 23	|Lisa晒BLACKPINK合照庆出道五周年	|641092|
 | 24	|宋威龙15岁海边照好帅	|619937|
 | 25	|曹格被狗咬伤	|569841|
 | 26	|张国伟只会说对对对的捧哏	|545301|
 | 27	|韩国男运动员获奖牌免兵役	|487043|
 | 28	|李荣浩为灵超放弃投票	|477509|
 | 29	|东京奥运中国军团破纪录图鉴	|436397|
 | 30	|父亲做核酸检测巧遇驰援的儿子	|431952|
 | 31	|欧尼熊妈妈	|431927|
 | 32	|北京奥运会yyds	|431126|
 | 33	|蔡徐坤胡渣自拍	|393944|
 | 34	|东京奥运会最后一个比赛日	|359341|
 | 35	|起底德堡惊人黑幕	|351552|
 | 36	|马龙人民日报撰文	|334057|
 | 37	|南京新增2例确诊均在集中隔离点发现	|327748|
 | 38	|分手后又复合是怎样一种体验	|312818|
 | 39	|喝完秋天第一杯奶茶失眠了	|302439|
 | 40	|安徽含山通报粗暴执法事件	|257162|
 | 41	|没想到国乒还能助眠	|253325|
 | 42	|34岁研究生菜市场摆摊卖鸡爪	|236873|
 | 43	|沈阳疫情	|236448|
 | 44	|熊敦瀚愿意为水球放弃美貌	|236183|
 | 45	|雪中悍刀行动画预告	|218843|
 | 46	|乔振宇25年前的美人尖	|216655|
 | 47	|诛仙动画首支pv	|211017|
 | 48	|德尔塔重新定义密接者	|209127|
 | 49	|东京奥运会上的神仙解说词	|208270|
 | 50	|我的工作做得就像中国跳水队员	|204134|
 
---结束---
 
 </p>
</details>
