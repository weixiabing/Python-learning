
from os import listdir  # 返回指定的文件夹包含的文件或文件夹的名字的列表
from PIL import Image
import json
# 读取 json 文件


def load_json(path):
    with open(path, 'r', encoding='utf-8-sig') as f:
        data = f.read()
        f.close()
        # 删除空格
    # 对json文件格式化解码
    data = json.loads(data)
    return data


# 查看data文件的结构
# print(data.keys())
# print(data['ServerState'].keys())
# 统计data['ServerState']['Cards']的对象个数
# print(len(data['ServerState']['Cards']))
# 判断data['ServerState']['Cards']的对象中是否有相同的CardDefId属性
# print(len(set([i['CardDefId'] for i in data['ServerState']['Cards']])))
# 打印data['ServerState']['Cards']的所有对象的CardDefId值
# print([i['CardDefId'] for i in data['ServerState']['Cards']])

# 读取cards_dict.json文件
def load_cards_dict():
    with open('cards_dict.json', 'r', encoding='utf-8-sig') as f:
        cards_dict = f.read()
        cards_dict = json.loads(cards_dict)
        f.close()
        return cards_dict


def load_pool_cards(data, cards_dict, pool):
    acquired_cards = set()
    unacquired_cards = set()
    acquired_cards = [i for i in set(
        [i['CardDefId'] for i in data['ServerState']['Cards']]) if i in cards_dict[pool]]
    unacquired_cards = [i for i in cards_dict[pool] if i not in acquired_cards]
    return acquired_cards, unacquired_cards




def image_merge(acquired_cards, unacquired_cards, pool, output_file):
    width, height = 310, 310
    list = pool
    
    acquired_images = [Image.open('assets/acquired.webp')] + [Image.open(f'assets/{list}/{card}.webp') for card in acquired_cards]
    unacquired_images = [Image.open('assets/unacquired.webp')] + [Image.open(f'assets/{list}/{card}.webp') for card in unacquired_cards]
    
    acquired_images = [img.resize((width, height), Image.BILINEAR) for img in acquired_images]
    unacquired_images = [img.resize((width, height), Image.BILINEAR) for img in unacquired_images]
    
    rows = (len(acquired_images) + len(unacquired_images) - 1) // 10 + 1
    board = Image.new('RGBA', (width * 10, height * rows))
    
    acquired_boxes = [(j * width, i * height, (j + 1) * width, (i + 1) * height) for i in range(len(acquired_images) // 10 + 1) for j in range(10) if i * 10 + j < len(acquired_images)]
    unacquired_boxes = [(j * width, (i + len(acquired_images) // 10 + 1) * height, (j + 1) * width, ((i + len(acquired_images) // 10 + 1) + 1) * height) for i in range(len(unacquired_images) // 10 + 1) for j in range(10) if i * 10 + j < len(unacquired_images)]
    
    for index, img, box in zip(range(len(acquired_images)), acquired_images, acquired_boxes):
        board.paste(img, box)
    for index, img, box in zip(range(len(unacquired_images)), unacquired_images, unacquired_boxes):
        board.paste(img, box)
        
    board.save(output_file)



def save_json(pool, acquired_cards, unacquired_cards, output_file):
    if pool != 'pool-3':
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump({'acquired_cards': acquired_cards, 'unacquired_cards': unacquired_cards}, f, ensure_ascii=False, indent=4)
        return

    with open('pool3_rank.json', 'r', encoding='utf-8') as f:
        pool3_rank = json.load(f)

    keycards = [i for i in unacquired_cards if i in pool3_rank['unacquired_card']['keycards']]
    combocards = [i for i in unacquired_cards if i in pool3_rank['unacquired_card']['Combocards']]
    othercards = [i for i in unacquired_cards if i not in keycards and i not in combocards]

    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump({'acquired_cards': acquired_cards, 'unacquired_cards': {'keycards': keycards,
            'Combocards': combocards, 'othercards': othercards}}, f, ensure_ascii=False, indent=4)



# 统计cards_dict中的值的数量


def count_cards(data, cards_dict):
    # 统计data['ServerState']['Cards']的对象属性CardDefId的不同值的个数
    print('卡牌总数：', len(set([i['CardDefId']
          for i in data['ServerState']['Cards']])))
    for list in cards_dict.keys():
        print(list, len([i for i in set([i['CardDefId'] for i in data['ServerState']
              ['Cards']]) if i in cards_dict[list]]), f'/{len(cards_dict[list])}')
