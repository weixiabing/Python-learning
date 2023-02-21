import random


def person_obj(d_type,health,attack):
    data={
        'type':d_type,
        'health':health,
        'attack':attack
    }
    return data

# 攻击机制种族 2>1,3>2,1>3 满足时产生暴击
def attack(p1,p2):
    if p1['tpye']-p2['type']==1 or p1['type']==3 and p2['type']==1:
       
        p2['health']-=p1['attack']*2
    else:
        p2['health']-=p1['attack']
    p1['health']-=p2['attack']



if __name__ == '__main__':
    args=locals()
    print(random.randint(0,10))
    #产生6个随机佣兵
    for i in range(6):
        args["p"+str(i)]=person_obj(random.randint(1,3),random.randint(0,10),random.randint(1,10))
        print('第{}个佣兵的类型：{}  攻击力：{} 血量：{}'.format(str(i+1),args["p"+str(i)]['type'],args["p"+str(i)]['attack'],args["p"+str(i)]['health']))
    #选择佣兵
    player0='1 2 3 4 5 6'.split(' ')
    player1=input("玩家选择佣兵:" )
    player1=player1.split(' ')
    player2=list(set(player0)-set(player1))
    player1=list(map(int,player1))
    player2=list(map(int,player2))
    
    #开始对战
    print('开始对战')
    print('----------------------------------------------------------')
    print('对手:')
    for i in range(3):
        print('第{}个佣兵的类型：{}  攻击力：{} 血量：{}'.format(str(i+1),args["p"+str(player2[i]-1)]['type'],args["p"+str(player2[i]-1)]['attack'],args["p"+str(player2[i]-1)]['health']))
    print('----------------------------------------------------------')
    print('手牌:')
    for i in range(3):
        print('第{}个佣兵的类型：{}  攻击力：{} 血量：{}'.format(str(i+1),args["p"+str(player1[i]-1)]['type'],args["p"+str(player1[i]-1)]['attack'],args["p"+str(player1[i]-1)]['health']))
    print('----------------------------------------------------------')

    #开始战斗
    for i in range(3):
        
    


