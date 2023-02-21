#删除str1中属于str2的字母
def delete(str1,str2):
    for i in str1:
        if i in str2:
            str1=str1.replace(i,'')
    print(str1+'(操作1后的字符串)')
    return str1
#大小写转换
def conver(str1):
    str1=str1.swapcase()
    print(str1+'(操作2后的字符串)')
    return str1

#删除str1中的空格
def delete_space(str1):
    str1=str1.replace(' ','')
    print(str1+'(操作3后的字符串)')
    return str1
   
if __name__ == '__main__':
    str1=input()
    str2=input()
    str3=delete(str1,str2)
    str4=conver(str3)
    str5=delete_space(str4)
 #结果输出到本地电脑，导出为result.txt
    with open('result.txt','w',encoding='utf-8') as f:
        f.write(str3+'(操作1后的字符串)\n')
        f.write(str4+'(操作2后的字符串)\n')
        f.write(str5+'(操作3后的字符串)\n')
    f.close()
    