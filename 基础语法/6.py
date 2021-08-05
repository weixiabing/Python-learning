my_list = [0,1,2,3,6,7,9,11]

result = filter(lambda x: x % 2!=0, my_list)

print(list(result))