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
## change
```diff
---start---

更新时间:2021-08-08 10:08:05linux远程更新
commit b7eeadfe4e905c53241d7455f04c8abd91c2d033
Author: weixiabing <weixiabing@hotmail.com>
Date:   Sun Aug 8 10:04:57 2021 +0800

    Github Action Auto Updated

diff --git a/README.md b/README.md
index 1defe43..a5156d6 100644
--- a/README.md
+++ b/README.md
@@ -15,16 +15,112 @@ Python的实战日记
 ```diff
 ---start---
 
-更新时间:2021-08-08 10:01:55
-commit 797b158e85309e29f1512b0264f7aca66b1d6a4f
-Merge: 747389c d020816
-Author: “weixiabing” <weixiabing@hotmail.com>
-Date:   Sun Aug 8 09:57:40 2021 +0800
+更新时间:2021-08-08 10:04:57
+commit ffddbc0d3e75ab0d4a9cc060f16c432aa599a204
+Author: weixiabing <weixiabing@hotmail.com>
+Date:   Sun Aug 8 10:01:55 2021 +0800
 
-    Merge branch 'main' of github.com:weixiabing/Python-learning into main
-    
-    Conflicts:
-    	README.md
+    Github Action Auto Updated
+
+diff --git a/README.md b/README.md
+index c886141..1defe43 100644
+--- a/README.md
++++ b/README.md
+@@ -15,86 +15,16 @@ Python的实战日记
+ ```diff
+ ---start---
+ 
+-更新时间:2021-08-08 09:51:19
+-commit 7eecf003abeb859c055dd76eed5991b2ac7e778b
++更新时间:2021-08-08 10:01:55
++commit 797b158e85309e29f1512b0264f7aca66b1d6a4f
++Merge: 747389c d020816
+ Author: “weixiabing” <weixiabing@hotmail.com>
+-Date:   Sun Aug 8 09:44:10 2021 +0800
++Date:   Sun Aug 8 09:57:40 2021 +0800
+ 
+-    1
+-
+-diff --git a/log.txt b/log.txt
+-new file mode 100644
+-index 0000000..c7ca733
+---- /dev/null
+-+++ b/log.txt
+-@@ -0,0 +1,58 @@
+-+commit 29c40583e29aa5fbd50db87e96a297e59c8a1c0b
+-+Author: weixiabing <weixiabing@hotmail.com>
+-+Date:   Sat Aug 7 16:56:59 2021 +0000
+-+
+-+    Github Action Auto Updated
+-+
+-+diff --git a/README.md b/README.md
+-+index 859b361..3f5fb34 100644
+-+--- a/README.md
+-++++ b/README.md
+-+@@ -15,13 +15,11 @@ Python的实战日记
+-+ ```diff
+-+ ---start---
+-+ 
+-+-更新时间:2021-08-08 00:53:52
+-+-commit 1f6e6d4bdfdb124ef0eefcf68893b6531acc9267
+-++更新时间:2021-08-08 00:56:59
+-++commit 2dee656d51425c5a2c7969a08c6c37c6272ba68c
+-+ Author: Wei.Xiabing <weixiabing@hotmail.com>
+-+-Date:   Sun Aug 8 00:52:48 2021 +0800
+-+-   schedule:
+-+--  - cron: '59 23 * * *'
+-+-+    - cron: '0/30 * * * *'
+-++Date:   Sun Aug 8 00:56:06 2021 +0800
+-++
+-+     Update README.md
+-+ 
+-+ ---end---
+-+
+-+commit 2dee656d51425c5a2c7969a08c6c37c6272ba68c
+-+Author: Wei.Xiabing <weixiabing@hotmail.com>
+-+Date:   Sun Aug 8 00:56:06 2021 +0800
+-+
+-+    Update README.md
+-+
+-+diff --git a/README.md b/README.md
+-+index 015e5dd..859b361 100644
+-+--- a/README.md
+-++++ b/README.md
+-+@@ -12,14 +12,16 @@ Python的实战日记
+-+ + [基础语法](https://github.com/weixiabing/Python-learning/tree/main/%E5%9F%BA%E7%A1%80%E8%AF%AD%E6%B3%95)
+-+ + [数据结构与算法](https://github.com/weixiabing/Python-learning/tree/main/%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84%E4%B8%8E%E7%AE%97%E6%B3%95)
+-+ ## change
+-+-```
+-++```diff
+-+ ---start---
+-+ 
+-+ 更新时间:2021-08-08 00:53:52
+-+ commit 1f6e6d4bdfdb124ef0eefcf68893b6531acc9267
+-+ Author: Wei.Xiabing <weixiabing@hotmail.com>
+-+ Date:   Sun Aug 8 00:52:48 2021 +0800
+-+-
+-++   schedule:
+-++-  - cron: '59 23 * * *'
+-+++    - cron: '0/30 * * * *'
+-+     Update README.md
+-+ 
+-+ ---end---
+-diff --git a/main.py b/main.py
+-index 05e3451..7eb997c 100644
+---- a/main.py
+-+++ b/main.py
+-@@ -1,4 +1,3 @@
+--import feedparser
+- import time
+- import os
+- import r
++    Merge branch 'main' of github.com:weixiabing/Python-learning into main
++    
++    Conflicts:
++    	README.md
+ 
+ ---end---
+ ```
 
 ---end---
 ```



<details>
<summary>Click for 微博热点榜</summary>

 ---开始---

更新时间:2021-08-08 10:38:11linux远程更新
1	美国总统拜登下令空袭塔利班	5044423
2	张勇阿里内网回应女员工被侵害	3137102
3	阿里回应女员工被侵害	1941359
4	陈思诚为佟丽娅庆生	1853265
5	俄罗斯跳高冠军太优雅了	1510848
6	夫妻二人隐瞒扬州行程被罚	1384553
•	CF最刚周年庆	
7	韩国男运动员获奖牌免兵役	1319757
8	父亲做核酸检测巧遇驰援的儿子	1200724
9	东京奥运中国军团破纪录图鉴	1130950
10	曹格被狗咬伤	1079719
11	佟丽娅38岁状态	985796
12	阿里巴巴	859209
13	马龙人民日报撰文	825328
14	欧尼熊妈妈	744858
15	东京奥运会最后一个比赛日	665346
16	张国伟只会说对对对的捧哏	615878
17	Lisa晒BLACKPINK合照庆出道五周年	615857
18	李荣浩为灵超放弃投票	605462
19	分手后又复合是怎样一种体验	565299
20	安徽含山通报粗暴执法事件	564396
21	蔡徐坤胡渣自拍	557228
22	喝完秋天第一杯奶茶失眠了	549743
23	江苏新增38例本土确诊病例	548581
24	没想到国乒还能助眠	536217
25	北京奥运会yyds	528945
26	河南新增24例本土确诊	495317
27	德尔塔重新定义密接者	471697
28	起底德堡惊人黑幕	453456
29	熊敦瀚愿意为水球放弃美貌	404716
30	乔振宇25年前的美人尖	394424
31	我的工作做得就像中国跳水队员	355904
32	网传武汉江夏阳性86个系谣言	337621
33	赵文卓举千金致敬李发彬	309867
34	杨绍辉创奥运会中国马拉松最佳排名	306118
35	开封7地调整为高风险	305790
36	清理队一天捞出5吨垃圾	296341
37	孙颖莎3秒不睡就算失眠	292327
38	能让许昕闭嘴的人是李晓霞	256374
39	31省区市新增81例本土确诊	254012
40	对2008最好的回答	253060
41	玉楼春	243503
42	艺术体操团体全能决赛	243456
43	郑州已发现多起家庭聚集性感染	243115
44	马云	242979
45	国风版奥运会	242917
46	Dina因裁判不公正丢失金牌后接受采访	242617
47	印度标枪冠军获赠500万元奖金	242527
48	黑龙江多地空调断货	235494
49	袁一琦第二	234929
50	3名航天员分享太空看奥运感受	228172

---结束---


</p>
</details>


