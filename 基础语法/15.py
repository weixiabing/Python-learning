import copy
list1=[1,4,[2,3]] 
list2=list1.copy()
list3=copy.deepcopy(list1)
print(id(list1)) 
print(id(list2)) 
print(id(list3))
print(id(list1[2][1])) 
print(id(list2[2][1]))
print(id(list3[2][1]))