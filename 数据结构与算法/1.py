import time
start_time=time.time()
for a in range(1001):
    for b in range(1001):
        for c in range(1001):
            if a+b+c==1000 and a**2+b**2==c**2:
                print('a,b,c:',a,b,b)
end_time=time.time()
print('所用时间：',(end_time-start_time))