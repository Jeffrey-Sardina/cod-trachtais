import pandas as pd
import sys

def read_counts(input_file):
    centr_df = pd.read_csv(input_file, header=None, sep='\t', quotechar=None, quoting=3, usecols=[0])
    return centr_df

def summary_stats(centr_df):
    avg = sum(centr_df[0]) / len(centr_df[0])
    quantiles_vals = [0, 0.25, 0.5, 0.75, 0.9, 0.95, 0.99, 0.991, 0.992,
        0.993, 0.994, 0.995, 0.996, 0.997, 0.998, 0.999, 1]
    quantile_df = centr_df[0].quantile(quantiles_vals)
    quantiles = [x for x in quantile_df]
    return avg, quantiles, quantiles_vals

def output_stats(avg, quantiles, quantiles_vals, print_header=True):    
    if print_header:
        header = 'avg,' + ','.join(str(x) for x in quantiles_vals)
        print(header)
    data = str(avg) + ',' + ','.join(str(x) for x in quantiles)
    print(data)

if __name__ == '__main__':
    input_file = sys.argv[1]
    print_header = sys.argv[2] == '1'
    centr_df = read_counts(input_file)
    avg, quantiles, quantiles_vals = summary_stats(centr_df)
    output_stats(avg, quantiles, quantiles_vals, print_header)
