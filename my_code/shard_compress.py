from ordered_set import OrderedSet
import sys
import string
import os
import subprocess
import glob
import compress

caractair = string.printable.strip()

def get_file_len(input_file):
    i = 0
    with open(input_file, 'r') as inp:
        for _ in inp:
            i += 1
    return i

def shard(input_file, output_files):
    print('ag cruthú scoilteanna')
    num_shards = len(output_files)
    total_len = get_file_len(input_file)
    shard_size = total_len / num_shards
    try:
        outs = []
        for i, output_file in enumerate(output_files):
            outs.append(open(output_file, 'w'))
        with open(input_file, 'r') as inp:
            i = 0
            curr_shard = 0
            for line in inp:
                if i > (curr_shard+1) * shard_size:
                    curr_shard += 1
                print(line.strip(), file=outs[curr_shard])
                i += 1
    except:
        raise
    finally:
        for out in outs:
            out.close()

def sh_sort_file(file):
    result = subprocess.run(['sort', '-rn', '-k2', file], stdout=subprocess.PIPE)
    out_text = result.stdout.decode('utf-8')
    os.remove(file)
    with open(file, 'w') as out:
        print(out_text, file=out)

def shard_counts(input_file, shard_files, count_files):
    shard(input_file, shard_files)
    print('ag cruthú comhad .count')
    for i, shard_file in enumerate(shard_files):
        count_map = compress.count(shard_file)
        with open(count_files[i], 'w') as out:
            for item in count_map:
                print(item, count_map[item], sep='\t', file=out)
        sh_sort_file(count_files[i])
        os.remove(shard_file)

def merge_sorted_counts(file1, file2, outfile):
    with open(file1, 'r') as inp1:
        with open(file2, 'r') as inp2:
            with open(outfile, 'w') as out:
                done = False
                while not done:
                    nxt_item = ''
                    nxt_count = 0
                    
                    data1 = next(inp1, ('')).strip().split('\t')
                    if len(data1) == 2:
                        item1, count1 = data1
                    elif len(data1) == 1:
                        pass
                    else:
                        raise ValueError('Too many values in the count file' + file1 + '; see:', data1)

                    data2 = next(inp2, '').strip().split('\t')
                    if len(data2) == 2:
                        item2, count2 = data2
                    elif len(data2) == 1:
                        pass
                    else:
                        raise ValueError('Too many values in the count file' + file2 + '; see:', data2)
        
                    if not item1:
                        nxt_item = item2
                        nxt_count = count2
                    if not item2:
                        nxt_item = item1
                        nxt_count = count1
                    if item1 and item2 and item1 == item2:
                        nxt_item = item1
                        nxt_count = count1 + count2
                    print(nxt_item, nxt_count, sep='\t', file=out)

def rec_merge(count_files):
    if len(count_files) == 0:
        return
    curr_file1 = count_files[0]
    count_files_new = []
    for i in range(1, len(count_files)):
        curr_file2 = count_files[i]
        nxt_file = curr_file1.split('.')[0] + '_merge_' + os.path.basename(curr_file2) + '.count'
        count_files_new.append(nxt_file)
        merge_sorted_counts(curr_file1, curr_file2, nxt_file)
        os.remove(curr_file1)
        os.remove(curr_file2)
    rec_merge(count_files_new)

def create_counts_file(input_file, shard_dir, num_shards):
    shard_files = [os.path.join(shard_dir, str(x) + '.shard') for x in range(num_shards)]
    count_files = [os.path.join(shard_dir, str(x) + '.count') for x in range(num_shards)]
    shard_counts(input_file, shard_files, count_files)

    print('ag cur comhad .count le chéile')
    rec_merge(count_files)

    count_files = glob.glob(os.path.join(shard_dir, '*.count'))
    if len(count_files) != 1:
        raise ValueError('Exactly 1 .count file should be left')
    return count_files[0]

def compress_counts_file(counts_file, input_file, output_file, table_file):
    #This file should still be sorted, since all components were!
    print('ag comhbhrú anois')
    table = []
    with open(counts_file, 'r') as inp:
        for line in inp:
            table.append(line.strip().split('\t')[0])

    compress.write_table(table, table_file)
    print('tábla scríofa (' + str(len(table)) + ' line)')
    
    print('ag scríobh an comhaid comhbhrúite')
    compress.write_compressed_file(table, input_file, output_file)
    print('comhaid comhbhrúite scríofa')

if __name__ == '__main__':
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    table_file = sys.argv[3]
    num_shards = int(sys.argv[4])
    shard_dir = os.path.dirname(output_file)

    counts_file = create_counts_file(input_file, shard_dir, num_shards)
    compress_counts_file(counts_file, input_file, output_file, table_file)
    exit(0)
