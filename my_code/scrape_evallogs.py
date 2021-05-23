import sys
import glob
import os
from config.search.general import get_val_for_iteration

def process_files(files):
    all_data = []
    for file in files:
        keys, vals = process_file(file)
        all_data.append(vals)
    return all_data, keys

def process_file(file):
    with open(file, 'r') as inp:
        for line in inp:
            if "Stats: " in line:
                csv_data = line.split("Stats: ")[1:][0]
                return extract_csv_data(csv_data)

def get_hyperparam_map():
    num_to_vals = {}
    i = 0
    while True:
        try:
            vals = ','.join(str(x) for x in get_val_for_iteration(i))
            num_to_vals[i] = vals
            i += 1
        except:
            break
    return num_to_vals

def extract_csv_data(csv_data):
    keys = []
    vals = []
    colon_sep_pairs = [x for x in csv_data.strip().split(',')]
    for pair in colon_sep_pairs:
        key, val = [x.strip() for x in pair.split(':')]
        keys.append(key)
        vals.append(val)
    return keys, vals

def write_as_csv(all_data, header_keys, output):
    num_to_vals = get_hyperparam_map()
    print(num_to_vals)
    with open(output, 'w') as out:
        print('lr,reg,loss_fn,operator,comparator', end=',',file=out)
        print(','.join(header_keys), file=out)
        for i, vals in enumerate(all_data):
            print(num_to_vals[i], end=',',file=out)
            print(','.join(vals), file=out)

if __name__ == '__main__':
    folder = sys.argv[1]
    output = sys.argv[2]
    files = glob.glob(os.path.join(folder,'*.evallog'))

    print(get_val_for_iteration(0))
    print(get_val_for_iteration(1))

    #all_data, keys = process_files(files)
    #write_as_csv(all_data, keys, output)
