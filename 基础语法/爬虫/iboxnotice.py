import bs4 # 网页解析，获取数据
import re # 正则表达式，进行文字匹配
import urllib # 制定url
import sqlite3 # SQL操作

def init_db(dbpath):
    sql = '''
        create table if not exists 'notice_info'
        (
            title text,
            date text
        )
    '''
    connect = sqlite3.connect(dbpath)  # 打开或创建数据库
    c = connect.cursor()  # 获取游标
    c.execute(sql)  # 执行SQL语句
    connect.commit()  # 提交事务
    connect.close()  # 关闭