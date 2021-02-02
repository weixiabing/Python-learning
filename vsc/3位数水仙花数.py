a=1
c=0
for item in range(100,1000):
    sum=0
    c=item
    for _ in range(3):
        a=c%10
        c//=10
        #b=1 
        sum+=a**3

        '''for _ in range(3):
            b*=a
        sum+=b'''
        
    if item==sum:
     print(item)