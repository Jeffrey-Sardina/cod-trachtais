import sys

def get_num_cols(file, expected):
    with open(file, 'r') as inp:
        cols = set()
        i = 0
        for line in inp:
            line_cols = len(line.strip().split('\t'))
            if line_cols != expected:
                print(line.strip().split('\t'))
                print(i)
                print()
            cols.add(line_cols)
            i += 1
    return cols

if __name__ == '__main__':
    #Verify that expected numcols = actuals numcols
    file = sys.argv[1]
    expected = int(sys.argv[2])
    print(get_num_cols(file, expected))
