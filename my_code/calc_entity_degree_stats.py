import pandas as pd
import sys

def read_counts(input_file):
    counts_df = pd.read_csv(input_file, header=None, sep='\t')
    counts_df.columns = ['counts', 'items']
    return counts_df

def summary_stats(counts_df):
    avg_count = sum(counts_df.counts) / len(counts_df.counts)
    quantile_df = counts_df.counts.quantile([0,0.25,0.5,0.75,1])
    min_count, q1_count, med_count, q3_count, max_count = [x for x in quantile_df]
    return avg_count, min_count, q1_count, med_count, q3_count, max_count

if __name__ == '__main__':
    input_file = sys.argv[1]
    counts_df = read_counts(input_file)
    stats = summary_stats(counts_df)
    print('\t'.join(str(x) for x in stats))
