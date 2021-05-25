from ordered_set import OrderedSet
import sys
import string

caractair = string.printable.strip()

def compress(input_file, output_file, table_file):
    print('ag cruthú an tábla')
    table = create_compression_table(input_file)
    write_table(table, table_file)
    print('tábla scríofa (' + str(len(table)) + ' line)')
    
    print('ag scríobh an comhaid comhbhrúite')
    write_compressed_file(table, input_file, output_file)
    print('comhaid comhbhrúite scríofa')

def create_compression_table(input_file):
    counts = count(input_file)
    return OrderedSet(sorted(counts.keys(), key=lambda x : counts[x], reverse=True))

def count(input_file):
    counts = {}
    with open(input_file, 'r', encoding='utf-8', errors='ignore') as inp:
        for line in inp:
            #X should have len 3; if not, bad data was given to the script
            x = [test.strip() for test in line.split('\t')]
            subject, predicate, obj = x

            if not subject in counts:
                counts[subject] = 0
            if not predicate in counts:
                counts[predicate] = 0
            if not obj in counts:
                counts[obj] = 0
            counts[subject] += 1
            counts[predicate] += 1
            counts[obj] += 1
    return counts

def write_table(table, table_file):
    with open(table_file, 'w') as output:
        for i, r in enumerate(table):
            print(to_base_94(i), r, sep='\t', file=output)

def write_compressed_file(table, input_file, output_file):
    with open(output_file, 'w') as output:
        with open(input_file, 'r', encoding='utf-8', errors='ignore') as inp:
            for line in inp:
                subject, predicate, obj = [to_base_94(table.index(test.strip())) for test in line.split('\t', 2)]
                print(subject, predicate, obj, sep='\t', file=output)

def to_base_94(num):
    #94, mar go bhfuil 94 caractar inphriontáilte ASCII (beart amháin)
    bonn = 94
    toradh = ''
    while True:
        toradh = caractair[num % bonn] + toradh
        num //= bonn
        if num == 0:
            break
    if toradh == '':
        return '0'
    return toradh

if __name__ == '__main__':
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    table_file = sys.argv[3]
    compress(input_file, output_file, table_file)
    exit(0)
