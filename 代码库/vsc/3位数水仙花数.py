a = 1
c = 0
for item in range(100, 1000):
    summ4 = 0
    c = item
    for _ in range(3):
        a = c % 10
        c //= 10
        # b=1
        summ4 += a ** 3

        '''for _ in range(3):
            b*=a
        sum+=b'''

    if item == summ4:
        print(item)
