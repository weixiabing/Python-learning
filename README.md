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

更新时间:2021-08-08 10:55:42linux远程更新
+ 1	美国总统拜登下令空袭塔利班	4916137<br>
 + 2	张勇阿里内网回应女员工被侵害	3252935<br>
 + 3	阿里回应女员工被侵害	1712413<br>
 + 4	俄罗斯跳高冠军太优雅了	1400742<br>
 + 5	陈思诚为佟丽娅庆生	1398836<br>
 + 6	艺术体操团体全能决赛	1379925<br>
 + 7	Dina因裁判不公正丢失金牌后接受采访	1320418<br>
 + 8	郑州已发现多起家庭聚集性感染	1212627<br>
 + 9	夫妻二人隐瞒扬州行程被罚	1183713<br>
 + 10	韩国男运动员获奖牌免兵役	1153799<br>
 + 11	佟丽娅38岁状态	1137411<br>
 + 12	阿里 破冰文化	1115631<br>
 + 13	曹格被狗咬伤	1033280<br>
 + 14	东京奥运中国军团破纪录图鉴	984716<br>
 + 15	阿里巴巴	931508<br>
 + 16	马云	929925<br>
 + 17	张国伟只会说对对对的捧哏	927875<br>
 + 18	父亲做核酸检测巧遇驰援的儿子	923895<br>
 + 19	Lisa晒BLACKPINK合照庆出道五周年	881889<br>
 + 20	李荣浩为灵超放弃投票	782423<br>
 + 21	马龙人民日报撰文	730105<br>
 + 22	欧尼熊妈妈	616610<br>
 + 23	东京奥运会最后一个比赛日	558316<br>
 + 24	蔡徐坤胡渣自拍	539573<br>
 + 25	北京奥运会yyds	517297<br>
 + 26	安徽含山通报粗暴执法事件	496952<br>
 + 27	分手后又复合是怎样一种体验	488429<br>
 + 28	喝完秋天第一杯奶茶失眠了	455838<br>
 + 29	没想到国乒还能助眠	447846<br>
 + 30	起底德堡惊人黑幕	427405<br>
 + 31	江苏新增38例本土确诊病例	408533<br>
 + 32	德尔塔重新定义密接者	342234<br>
 + 33	河南新增24例本土确诊	338856<br>
 + 34	乔振宇25年前的美人尖	332087<br>
 + 35	熊敦瀚愿意为水球放弃美貌	322157<br>
 + 36	我的工作做得就像中国跳水队员	271487<br>
 + 37	赵文卓举千金致敬李发彬	256655<br>
 + 38	开封7地调整为高风险	250224<br>
 + 39	孙颖莎3秒不睡就算失眠	226104<br>
 + 40	网传武汉江夏阳性86个系谣言	220960<br>
 + 41	对2008最好的回答	220494<br>
 + 42	世界看到了中国年轻人最好的样子	220442<br>
 + 43	南京市第19场疫情防控新闻发布会	219704<br>
 + 44	国风版奥运会	218822<br>
 + 45	东京奥运会上的神仙解说词	218762<br>
 + 46	原来奥运会结束还要写总结	218021<br>
 + 47	能让许昕闭嘴的人是李晓霞	217689<br>
 + 48	清理队一天捞出5吨垃圾	215333<br>
 + 49	杨绍辉创奥运会中国马拉松最佳排名	214381<br>
 + 50	31省区市新增81例本土确诊	211267<br>
 
---结束---


</p>
</details>


