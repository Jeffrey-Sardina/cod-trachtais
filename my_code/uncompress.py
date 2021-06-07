import sys
import pandas as pd

def load_table(compression_table):
    print('ag lódáil an tábla')
    table = {}
    with open(compression_table, 'r') as inp:
        for line in inp:
            #Má tá níos mó na sin ann, tá earráid sa tábla féin
            idx, val = line.strip().split('\t')
            table[idx] = val
    return table

def uncompress_stream(predictions_file, table, output):
    print('ag díchomhbhrú')
    with open(predictions_file, 'r') as inp:
        with open(output, 'w') as out:
            for line in inp:
                compression_code, embedding = line.split('\t', 1)
                uncompressed = table[compression_code]
                new_line = uncompressed + '\t' + embedding
                print(new_line, end='', file=out)

if __name__ == '__main__':
    predictions_file = sys.argv[1]
    compression_table = sys.argv[2]
    output = sys.argv[3]
    table = load_table(compression_table)
    uncompress_stream(predictions_file, table, output)
    exit(0)
