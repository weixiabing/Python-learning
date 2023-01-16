# %%
import os
import sys  # 导入模块


def del_prefix_files():  # 定义函数名称
     # 准备添加的前缀内容
    old_names = os.listdir(path)  # 取路径下的文件名，生成列表
    for old_name in old_names:  # 遍历列表下的文件名
        if old_name != sys.argv[0]:  # 代码本身文件路径，防止脚本文件放在path路径下时，被一起重命名
            if old_name.endswith('.webp'):
                new_name = old_name.split('-')[0] + '.webp'
                os.rename(os.path.join(path, old_name),
                          os.path.join(path, new_name))  # 重命名文件
                


if __name__ == '__main__':
    path = r'D:\downloads\snap/pool-5'  # 运行程序前，记得修改主文件夹路径！
    del_prefix_files()  # 调用定义的函数，注意名称与定义的函数名一致
