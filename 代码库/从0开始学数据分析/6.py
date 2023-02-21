#统计不重复单词个数
def main():
    dic=input()
    dic=dic.split()
    dic=set(dic)
    print(len(dic))
    return

if __name__ == '__main__':
    main()