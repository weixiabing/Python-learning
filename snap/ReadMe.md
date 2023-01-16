# main.py命令详解

python main.py -c `<command>` -i <input_file> -o <output_file>

`<comoand>  `

`get_cards_StarterCard   获取初始卡情况`

`get_cards _pool-1  	获取1池情况`

`get_cards _pool-2	获取2池情况`

`get_cards _pool-3	获取3池情况`

`get_cards _pool-4	获取4池情况`

`get_cards _pool-5	获取5池情况`

`get_cards _lv1-14	获取1-14级卡牌情况`

`get_cards_season1`获取第一赛季卡牌情况

`get_cards_season4`获取第4赛季卡牌情况

`get_cards_season5`获取第5赛季卡牌情况

count_cards 统计所有池子的信息

2和3赛季无新卡

<input_file>  CollectionState.json文件的位置

<output_file>   输出文件的位置，可选json和png格式 json文件中 分为已获得和未获得，对3池的未获得进行细分为3池核心卡必锁，非绝对核心的套路卡和其他卡
