# %%
from os import listdir  # 返回指定的文件夹包含的文件或文件夹的名字的列表
from PIL import Image
import json
# 读取 json 文件
def load_json(path):
    with open('CollectionState.json', 'r', encoding='utf-8-sig') as f:
        data = f.read()
        f.close()
        # 删除空格
    # 对json文件格式化解码
    data = json.loads(data)
    return data


# %%
# 查看data文件的结构
#print(data.keys())
#print(data['ServerState'].keys())
# 统计data['ServerState']['Cards']的对象个数
#print(len(data['ServerState']['Cards']))
# 判断data['ServerState']['Cards']的对象中是否有相同的CardDefId属性
#print(len(set([i['CardDefId'] for i in data['ServerState']['Cards']])))
# 打印data['ServerState']['Cards']的所有对象的CardDefId值
# print([i['CardDefId'] for i in data['ServerState']['Cards']])


# %%
# 读取cards_dict.json文件
def load_cards_dict():
    with open('cards_dict.json', 'r', encoding='utf-8-sig') as f:
        cards_dict = f.read()
        cards_dict = json.loads(cards_dict)
        f.close()
        return cards_dict

def load_pool_cards(data,cards_dict,pool):
    acquired_cards=set()
    unacquired_cards=set()
    acquired_cards=[i for i in set([i['CardDefId'] for i in data['ServerState']['Cards']]) if i in cards_dict[pool]] 
    unacquired_cards=[i for i in cards_dict[pool] if i not in acquired_cards]
    return acquired_cards,unacquired_cards


def image_merge(acquired_cards,unacquired_cards,pool,output_file):  # 定义拼接图片函数
    width = 310  # 设置图片宽度
    height = 310  # 设置图片高度
    list = pool
    acquired_cards_image_list=[Image.open('assets/acquired.webp')]
    acquired_cards_image_list = acquired_cards_image_list+[Image.open(f'assets/{list}/{acquired_cards[i]}.webp')
                  for i in range(len(acquired_cards))]  # 读取图片
    unacquired_cards_image_list=[Image.open('assets/unacquired.webp')]
    unacquired_cards_image_list = unacquired_cards_image_list+[Image.open(f'assets/{list}/{unacquired_cards[i]}.webp')
                    for i in range(len(unacquired_cards))]  # 读取图片
    acquired_cards_image_resized=[image.resize((width,height),Image.BILINEAR) for image in acquired_cards_image_list ]
    unacquired_cards_image_resized=[image.resize((width,height),Image.BILINEAR) for image in unacquired_cards_image_list ]
    #print(len(unacquired_cards_image_resized),len(acquired_cards_image_resized))  # 测试图片数量
    blank_board = Image.new('RGBA',size=(
        width*10, height*(((len(unacquired_cards_image_resized))//10+1)+((len(acquired_cards_image_resized))//10+1))))  # 新建空白画布
    #print(blank_board.size[0], blank_board.size[1])  # 测试白板尺寸
    boxs1 = []  # 用来存放黏贴图片位置（四至）
    boxs2 = []  # 用来存放黏贴图片位置（四至）
    #print(acquired_cards_image_resized)
    for i in range(len(acquired_cards_image_resized)//10+1):
        for j in range(10):
            if i*10+j < len(acquired_cards_image_resized):
                box = (j*width, i*height, (j+1)*width, (i+1)*height)
                boxs1.append(box)
    for index1, bo1 in enumerate(boxs1):  # 待黏贴的图片序号和位置
        blank_board.paste(acquired_cards_image_resized[index1], bo1)  # 在空白板上对应位置黏贴对应图片
    for i in range(len(unacquired_cards_image_resized)//10+1):
        for j in range(10):
            if i*10+j < len(unacquired_cards_image_resized):
                box = (j*width, (i+len(acquired_cards_image_resized)//10+1)*height,
                       (j+1)*width, ((i+len(acquired_cards_image_resized)//10+1)+1)*height)
                boxs2.append(box)
    for index2, bo2 in enumerate(boxs2):  # 待黏贴的图片序号和位置
        blank_board.paste(unacquired_cards_image_resized[index2], bo2)  # 在空白板上对应位置黏贴对应图片
    
    blank_board.save(output_file)# 保存黏贴结果


# %%
# 统计cards_dict中的值的数量


def count_cards(data, cards_dict):
    # 统计data['ServerState']['Cards']的对象属性CardDefId的不同值的个数
    print('卡牌总数：', len(set([i['CardDefId']
          for i in data['ServerState']['Cards']])))
    for list in cards_dict.keys():
        print(list, len([i for i in set([i['CardDefId'] for i in data['ServerState']
              ['Cards']]) if i in cards_dict[list]]), f'/{len(cards_dict[list])}')

