#根据目录结构生成卡牌分类字典
import os
import json
def create_cards_dict():  # 定义函数名称
     # 准备添加的前缀内容
    lists = os.listdir(path)  # 取路径下的文件名，生成列表
    cards_dict = {}  # 创建空字典
    for list in lists:  # 遍历列表下的文件名
       cards= os.listdir(path + '/' + list) 
       cards= [card.split('.')[0] for card in cards]   
       #导入字典中
       cards_dict[list] = cards     
    with open('cards_dict.json', 'w', encoding='utf-8') as f:
        json.dump(cards_dict, f, ensure_ascii=False, indent=4)
if __name__ == '__main__':
    path = r'D:/library/Github/Python-learning/snap/assets'  # 运行程序前，记得修改主文件夹路径！
    create_cards_dict()  # 调用定义的函数，注意名称与定义的函数名一致
    



