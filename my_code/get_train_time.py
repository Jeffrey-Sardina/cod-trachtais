import sys
from datetime import datetime

def get_first_and_last_lines(in_file):
    first_line = None
    last_line = None
    with open(in_file, 'r') as inp:
        i = 0
        for line in inp:
            if i == 0:
                first_line = line
            elif len(line.strip()) > 0:
                last_line = line
            i += 1
    return first_line, last_line

def get_time(line):
    time_section = line.strip().split(',')[0]
    return datetime.strptime(time_section, "%Y-%m-%d %H:%M:%S")

def get_time_difference(first_line, last_line):
    start = get_time(first_line)
    end = get_time(last_line)
    return (end-start).total_seconds()

if __name__ == '__main__':
    in_file = sys.argv[1]
    verbose = sys.argv[2] == '1'
    first, last = get_first_and_last_lines(in_file)
    time = get_time_difference(first, last)
    if verbose:
        print(time, 'soicind')
        print(time / 60, 'nóiméad')
        print(time / 60 / 60, 'uair')
        print(time / 60 / 60 / 24, 'lá') 
    else:
        print(time)
