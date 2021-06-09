import sys

def calc_counts(sorted_file):
    with open(sorted_file, 'r') as inp:
        curr_item = None
        curr_count = 0
        for line in inp:
            line = line.strip()
            if curr_item == line:
                curr_count += 1
            else:
                print(curr_count, curr_item, sep='\t')
                curr_item = line
                curr_count = 1

if __name__ == '__main__':
    input_file = sys.argv[1]
    calc_counts(input_file)
    exit(0)
