from ordered_set import OrderedSet
import sys
import os
import compress
import pandas as pd
import glob

# def get_file_len(input_file):
#     i = 0
#     with open(input_file, 'r') as inp:
#         for _ in inp:
#             i += 1
#     return i

# def shard(input_file, output_files):
#     print('ag cruthú scoilteanna')
#     num_shards = len(output_files)
#     total_len = get_file_len(input_file)
#     shard_size = total_len / num_shards
#     try:
#         outs = []
#         for i, output_file in enumerate(output_files):
#             outs.append(open(output_file, 'w'))
#         with open(input_file, 'r') as inp:
#             i = 0
#             curr_shard = 0
#             for line in inp:
#                 if i > (curr_shard+1) * shard_size:
#                     curr_shard += 1
#                 print(line, file=outs[curr_shard], end='')
#                 i += 1
#     except:
#         raise
#     finally:
#         for out in outs:
#             out.close()

def sort_file(file, by_count=False):
    df = pd.read_csv(file, header=None, sep='\t', quotechar=None, quoting=3)
    if by_count:
        df = df.sort_values(by=0, ascending=False)
    else:
        df = df.sort_values(by=1, ascending=False)
    os.remove(file)
    df.to_csv(file, sep='\t', header=None, index=False, quotechar=None, quoting=3)

def shard_counts(shard_files, count_files):
    print('ag cruthú comhad .count')
    for i, shard_file in enumerate(shard_files):
        count_map = compress.count(shard_file)
        with open(count_files[i], 'w') as out:
            for item in count_map:
                if count_map[item] == "0":
                    print('----------')
                print(count_map[item], item, sep='\t', file=out)
        sort_file(count_files[i])

def get_next(inp):
    data = next(inp, ('')).strip().split('\t')
    if len(data) == 2:
        count, item = data
        count = int(count)
    elif len(data) == 1:
        count = None
        item = None
    else:
        raise ValueError('Too many values in the count file' + str(inp) + '; see:', data)
    return count, item

def merge_sorted_counts(file1, file2, outfile):
    print(outfile)
    with open(file1, 'r') as inp1:
        with open(file2, 'r') as inp2:
            with open(outfile, 'w') as out:
                sample_inp1 = True
                sample_inp2 = True
                count1 = None
                item1 = None
                count2 = None
                item2 = None

                while True:
                    if sample_inp1:
                        count1, item1 = get_next(inp1)
                    if sample_inp2:
                        count2, item2 = get_next(inp2)

                    if not item1 and not item2:
                        break
                    if item1 == item2:
                        print(count1 + count2, item1, sep='\t', file=out)
                        sample_inp1 = True
                        sample_inp2 = True
                    else:
                        if item1 and (not item2 or item1 > item2):
                            print(count1, item1, sep='\t', file=out)
                            sample_inp1 = True
                            sample_inp2 = False
                        if item2 and (not item1 or item2 > item1):
                            print(count2, item2, sep='\t', file=out)
                            sample_inp1 = False
                            sample_inp2 = True

def rec_merge(count_files):
    #Base case--nothing left to merge
    if len(count_files) == 1:
        return count_files[0]

    #Merge the current set of files
    count_files_new = []
    for i in range(0, len(count_files), 2):
        #Get files (or end if no pair can be found)
        curr_file1 = count_files[i]
        if i + 1 < len(count_files):
            curr_file2 = count_files[i+1]
        else:
            count_files_new.append(curr_file1)
            break

        #Combine pairs into a single file
        folder_path = os.path.dirname(curr_file1)
        num1 = os.path.basename(curr_file1).split('.')[0]
        num2 = os.path.basename(curr_file2).split('.')[0]
        nxt_file = os.path.join(folder_path, num1 + '_m_' + num2 + '.count')
        count_files_new.append(nxt_file)
        merge_sorted_counts(curr_file1, curr_file2, nxt_file)

    #Now run again on the smaller (half the size) set of merged files
    return rec_merge(count_files_new)

def create_counts_file(shard_dir, num_shards):
    shard_files = glob.glob((os.path.join(shard_dir, '*.shard')))
    count_files = [os.path.join(shard_dir, str(x) + '.count') for x in range(num_shards)]
    shard_counts(shard_files, count_files)

    print('ag cur comhad .count le chéile')
    all_counts_file = rec_merge(count_files)
    sort_file(all_counts_file, by_count=True)

    return all_counts_file

def compress_counts_file(counts_file, input_file, output_file, table_file):
    #This file should still be sorted, since all components were!
    print('ag comhbhrú anois')
    table = []
    with open(counts_file, 'r') as inp:
        for line in inp:
            line = line.strip()
            if len(line) == 0:
                continue
            table.append(line.split('\t')[1])
    table = OrderedSet(table)

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

    counts_file = create_counts_file(shard_dir, num_shards)
    compress_counts_file(counts_file, input_file, output_file, table_file)
    exit(0)
