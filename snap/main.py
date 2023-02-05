import argparse
import function

def parse_args():
    parser = argparse.ArgumentParser(description='Process some inputs')
    parser.add_argument('-c', '--command', required=True, help='command to run')
    parser.add_argument('-i', '--input_file', required=True, help='input file')
    parser.add_argument('-o', '--output_file', required=True, help='output file')
    return parser.parse_args()

def main():
    args = parse_args()
    data = function.load_json(args.input_file)
    cards_dict = function.load_cards_dict()

    if args.command.startswith('get_cards'):
        pool = args.command.split('_')[-1]
        acquired_cards, unacquired_cards = function.load_pool_cards(data, cards_dict, pool)
        ext = args.output_file.split('.')[-1]
        if ext in ['png', 'jpg', 'jpeg', 'webp', 'bmp']:
            function.image_merge(acquired_cards, unacquired_cards, pool, args.output_file)
        elif ext == 'json':
            function.save_json(pool, acquired_cards, unacquired_cards, args.output_file)
    elif args.command == 'count_cards':
        function.count_cards(data, cards_dict)

if __name__ == '__main__':
    main()
