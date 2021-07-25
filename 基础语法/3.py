#split join
import time
time1=time.time()
li=[]
for i in range(10000000):
    li.append('sx')
a=''.join(li)
time2=time.time()
print(time2-time1)