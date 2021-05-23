import sys
import pandas as pd

def uncompress(predictions_file, compression_table, output):
    #Load data
    predictions = pd.read_csv(predictions_file, sep='\t', header=None)
    
    #Load compression table
    table = {}
    with open(compression_table, 'r') as inp:
        for line in inp:
            #Má tá níos mó na sin ann, tá earráid sa tábla féin
            idx, val = line.strip().split('\t')
            table[idx] = val

    #Decompress and output
    print(predictions[0])
    predictions[0] = predictions[0].apply(lambda x : table[x])
    predictions.to_csv(output, header=False, index=False, sep='\t')

if __name__ == '__main__':
    predictions_file = sys.argv[1]
    compression_table = sys.argv[2]
    output = sys.argv[3]
    uncompress(predictions_file, compression_table, output)
    exit(0)
