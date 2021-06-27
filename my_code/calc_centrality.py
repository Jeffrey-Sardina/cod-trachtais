import sys
import os

def incrememnt(counts_dict, item):
    if not item in counts_dict:
        counts_dict[item] = 0
    counts_dict[item] += 1

def calc_centralities(nt_file):
    outdegree_counts = {}
    totaldegree_counts = {}
    with open(nt_file, 'r') as inp:
        for line in inp:
            sbj, _, obj = line.strip().split('\t')
            incrememnt(outdegree_counts, sbj)
            incrememnt(totaldegree_counts, sbj)
            incrememnt(totaldegree_counts, obj)
    return outdegree_counts, totaldegree_counts

def write_data(output_dir, outdegree_counts, totaldegree_counts):
    indeg_out = os.path.join(output_dir, 'indeg.tsv')
    outdeg_out = os.path.join(output_dir, 'outdeg_out.tsv')
    totaldeg_out = os.path.join(output_dir, 'totaldeg_out.tsv')
    with open(indeg_out, 'w') as indg:
        with open(outdeg_out, 'w') as outdg:
            with open(totaldeg_out, 'w') as totaldg:
                for item in outdegree_counts:
                    #outdeg output
                    print(outdegree_counts[item], item, file=indg, sep='\t')
                
                for item in totaldegree_counts:
                    #deg output
                    print(totaldegree_counts[item], item, file=totaldg, sep='\t')

                    #indeg output
                    indeg = totaldegree_counts[item]
                    if item in outdegree_counts:
                        indeg -= outdegree_counts[item]
                    print(indeg, item, file=outdg, sep='\t')

if __name__ == '__main__':
    nt_file = sys.argv[1] #all.tsv or all_compressed.tsv
    output_dir = sys.argv[2]
    outdegree_counts, totaldegree_counts = calc_centralities(nt_file)
    write_data(output_dir, outdegree_counts, totaldegree_counts)
