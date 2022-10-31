s=[]
s.append([1,1,1,1,1])
s.append([0,1,1,1,1])
def function(s,i):
    s.append([0,s[i][0],s[i][1],s[i][2],s[i][3]])
    #s[i+1,0]为s[i,2]和s[i,4]的异或结果
    s[i+1][0]=s[i][2]^s[i][4]
    return s
i=1

while s[i]!=[1,1,1,1,1] and i!=0:
    function(s,i)
    i+=1

for i in range(len(s)):
    #不换行
    print(s[i][4],end='')

