# Command-Line Utility to Parse Data and Visualize Results

## Description
This is a Python-based command-line utility to parse data and visualize the results. The input data is read from a JSON file, and the output can be saved as a JSON file or image file. 

## Usage
main.py -c <command> -i <input_file> -o <output_file>
or 
main.py --command=<command> --input_file=<input_file> --output_file=<output_file>

## Options
-h, --help : Show the usage of the command-line utility.
-c, --command : Specify the command to run, including "get_cards_StarterCard", "get_cards_pool-1", "get_cards_pool-2", "get_cards_pool-3", "get_cards_pool-4", "get_cards_pool-5", "get_cards_lv1-14", "get_cards_season1", "get_cards_season4", "get_cards_season5", "count_cards".
-i, --input_file : Specify the input file in JSON format.
-o, --output_file : Specify the output file, either in JSON format or image format (png, jpg, jpeg, webp, bmp).

## Example
main.py -c get_cards_pool-1 -i data.json -o pool-1.png
or 
main.py --command=get_cards_pool-1 --input_file=data.json --output_file=pool-1.png

## Dependencies
The following dependencies are required to run the command-line utility:
- Python 3.x
- getopt
- function (a custom module for data parsing and visualization)

