import matplotlib.pyplot as plt
import pandas as pd
import sys
import os

def load_data(file, num_triples, invert_data=False, header=None, col_num=0, sep='\t'):
    hist_df = pd.read_csv(file, header=header, usecols=[col_num], sep=sep)
    hist_df /= num_triples
    if invert_data:
        hist_df = 1 / hist_df
    return hist_df

def draw_hist(hist_df, bins, log_x, log_y, inverted, title):
    plt.hist(hist_df, bins=bins, log=log_y)
    if log_x:
        plt.xscale('log')

    plt.title(title)
    if inverted:
        plt.xlabel('1 / ocurrences')
    else:
        plt.xlabel('count')
    plt.ylabel('number of entities')
    plt.show()

if __name__ == '__main__':
    hist_file = sys.argv[1]
    log_x = sys.argv[2] == '1'
    log_y = sys.argv[3] == '1'
    bins = int(sys.argv[4])
    invert_data = sys.argv[5] == '1'
    num_triples = int(sys.argv[6]) #nó 1 chun neamhaide a dhéanamh

    title = hist_file + '\n' \
        + str(bins) + ' bins ' \
        + ('inverted' if invert_data else '')

    hist_df = load_data(hist_file, num_triples, invert_data)
    draw_hist(hist_df, bins, log_x, log_y, invert_data, title)
