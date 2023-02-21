for i in range(1,11):
    exec( 'a%s = []' % i)
print(a1)

v = locals()
lst1 = range(10)

for i in lst1:
    v['A'+ str(i+1)] = [1,2,3]