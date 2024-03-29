import sys

def get_num_cols(file, expected):
    with open(file, 'r', encoding='utf-8', errors='ignore') as inp:
        cols = set()
        i = 0
        for line in inp:
            line_cols = len(line.strip().split('\t'))
            if line_cols != expected:
                print(i)
            cols.add(line_cols)
            i += 1
    return cols

if __name__ == '__main__':
    #Verify that expected numcols = actual numcols
    file = sys.argv[1]
    expected = int(sys.argv[2])
    cols = get_num_cols(file, expected)
    if len(cols) > 1 or cols.pop() != expected:
        print('Dump: numcols params')
        print(cols)
        print(file)
        print(expected)
        print()
        raise ValueError('Tá ar a laghad ró amháin ann leis an uimhir colúin mícheart aige')
    exit(0)
