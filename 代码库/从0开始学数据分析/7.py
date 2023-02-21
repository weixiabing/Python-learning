import string
s=input()

for i in s:
   
    if i in string.punctuation:
        s = s.replace(i, ' ')

lst =set( s.split())
print(len(lst))