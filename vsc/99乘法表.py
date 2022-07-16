a = 1
b = 1
for a in range(1, 1111):
    for b in range(1, a + 1):
        print(str(a) + '*' + str(b) + '=' + str(a * b), end='\t')
    print()
