import sys
import glob
import os

#Code: xy
#x = search folder id (ie, search/ vs search_1/)
#y = round (1, 2, or 3)

config_to_use = sys.argv[3].strip()
if len(config_to_use) == 0 or int(config_to_use) == 0: #00
    from config.search.general import get_val_for_iteration
    test_stats='lr,reg,loss_fn,operator,comparator'
elif int(config_to_use) == 1: #01
    from config.search.batches_2 import get_val_for_iteration
    test_stats='batch_size,num_batch_negs,num_uniform_negs'
elif  int(config_to_use) == 2: #02
    from config.search.epochs_3 import get_val_for_iteration
    test_stats='epochs,dimensions'
elif int(config_to_use) == 10:
    from config.search_1.general import get_val_for_iteration
    test_stats='lr,reg,loss_fn,operator,comparator'
elif int(config_to_use) == 11: #01
    from config.search_1.batches_2 import get_val_for_iteration
    test_stats='batch_size,num_batch_negs,num_uniform_negs'
elif  int(config_to_use) == 12: #02
    from config.search_1.epochs_3 import get_val_for_iteration
    test_stats='epochs,dimensions'

def process_files(files):
    all_data = []
    keys = []
    for file in files:
        keys, vals = process_file(file)
        all_data.append(vals)
    return all_data, keys

def process_file(file):
    with open(file, 'r') as inp:
        for line in inp:
            if "Stats: " in line:
                csv_data = line.split("Stats: ")[1:][0]
                keys, vals = extract_csv_data(csv_data)
                return keys, vals

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
    with open(output, 'w') as out:
        print(test_stats, end=',', file=out)
        print(','.join(header_keys), file=out)
        for i, vals in enumerate(all_data):
            print(num_to_vals[i], end=',',file=out)
            print(','.join(vals), file=out)

if __name__ == '__main__':
    folder = sys.argv[1]
    output = sys.argv[2]
    files = glob.glob(os.path.join(folder,'*.evallog'))
    all_data, keys = process_files(files)
    write_as_csv(all_data, keys, output)
    exit(0)
