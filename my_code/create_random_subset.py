import sys
import os
import random

def create_subset(src_data_folder, dst_data_folder, num_triples_to_keep):
    input_file = os.path.join(src_data_folder, 'all_compressed.tsv')
    keep_ratio = num_triples_to_keep / get_num_triples(input_file)
    output_file = os.path.join(dst_data_folder, 'all_compressed.tsv')

    with open(input_file, 'r') as inp:
        with open(output_file, 'w') as out:
            for line in inp:
                if random.random() < keep_ratio:
                    print(line.strip(), file=out)

def get_num_triples(file):
    with open(file, 'r') as inp:
        i = 0
        for _ in inp:
            i += 1
    return i

if __name__ == '__main__':
    src_data_folder = sys.argv[1]
    dst_data_folder = sys.argv[2]
    num_triples_to_keep = int(sys.argv[3])

    create_subset(src_data_folder, dst_data_folder, num_triples_to_keep)
    exit(0)
