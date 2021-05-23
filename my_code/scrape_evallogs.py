import sys
import glob
import os

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
    with open(output, 'w') as out:
        print(','.join(header_keys), file=out)
        for vals in all_data:
            print(','.join(vals), file=out)

if __name__ == '__main__':
    folder = sys.argv[1]
    output = sys.argv[2]
    files = glob.glob(os.path.join(folder,'*.evallog'))
    all_data, keys = process_files(files)
    write_as_csv(all_data, keys, output)
