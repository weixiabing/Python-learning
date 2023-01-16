import function
import sys
import getopt


def load_argv(argv):
    input_file = ""
    output_file = ""
    # "hi:o:": 短格式分析串, h 后面没有冒号, 表示后面不带参数; i 和 o 后面带有冒号, 表示后面带参数
    # ["help", "input_file=", "output_file="]: 长格式分析串列表, help后面没有等号, 表示后面不带参数; input_file和output_file后面带冒号, 表示后面带参数
    # 返回值包括 `opts` 和 `args`, opts 是以元组为元素的列表, 每个元组的形式为: (选项, 附加参数)，如: ('-i', 'test.png');
    # args是个列表，其中的元素是那些不含'-'或'--'的参数
    opts, args = getopt.getopt(argv[1:], "hc:i:o:", ["help", "command=","input_file=", "output_file="])

    for opt, arg in opts:
        if opt in ("-h", "--help"):
            print('main.py -c <command> -i <input_file> -o <output_file>')
            print('or: main.py --command=<command> --input_file=<input_file> --output_file=<output_file>')
            sys.exit()
        elif opt in ("-c", "--command"):
            command = arg
        elif opt in ("-i", "--input_file"):
            input_file = arg
        elif opt in ("-o", "--output_file"):
            output_file = arg
    return command,input_file,output_file


if __name__ == '__main__':
    command,input_file,output_file=load_argv(sys.argv)
    #读取json文件
    data=function.load_json(input_file)
    #读取cards_dict.json文件
    cards_dict=function.load_cards_dict()
    #读取已获得和未获得卡池
    get_cards_command_list=['get_cards_StarterCard','get_cards_pool-1','get_cards_pool-2','get_cards_pool-3',
    'get_cards_pool-4','get_cards_pool-5','get_cards_lv1-14','get_cards_season1','get_cards_season4','get_cards_season5']
    if command in get_cards_command_list:
        pool=command.split('_')[-1]
        acquired_cards,unacquired_cards=function.load_pool_cards(data,cards_dict,pool)
        ext=output_file.split('.')[-1]
        if ext==('png'or 'jpg'or 'jpeg'or 'webp'or 'bmp'):
            function.image_merge(acquired_cards,unacquired_cards,pool,output_file)#合成图片 
        elif ext=='json':
            function.save_json(pool,acquired_cards,unacquired_cards,output_file)
    elif command=='count_cards':
        function.count_cards(data, cards_dict)
    
    
    