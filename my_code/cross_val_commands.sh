#!/bin/bash

python cross_val_plot.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/bioportal_randsub_4000_ranking_avg.csv \
    r1 num_batch_negs num_uniform_negs \
    batch_size -eq 500 &

python cross_val_plot.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/bioportal_randsub_4000_ranking_avg.csv \
    r1 num_batch_negs num_uniform_negs \
    batch_size -eq 1000 &

python cross_val_plot.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/bioportal_randsub_4000_ranking_avg.csv \
    r1 num_batch_negs num_uniform_negs \
    batch_size -eq 1500 &

python cross_val_plot.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/bioportal_randsub_4000_ranking_avg.csv \
    r1 num_batch_negs num_uniform_negs \
    batch_size -eq 2000 &

# python cross_val_plot.py \
#     ../iterations_search_1/cumulative/its_1_2_and_3/round2/dbsnp_randsub_4000_avg.csv \
#     r1 num_batch_negs num_uniform_negs \
#     batch_size -eq 500 &

# python cross_val_plot.py \
#     ../iterations_search_1/cumulative/its_1_2_and_3/round2/drugbank_randsub_4000_avg.csv \
#     r1 num_batch_negs num_uniform_negs \
#     batch_size -eq 500 &

# python cross_val_plot.py \
#     ../iterations_search_1/cumulative/its_1_2_and_3/round2/omim_randsub_4000_avg.csv \
#     r1 num_batch_negs num_uniform_negs \
#     batch_size -eq 500 &

# python cross_val_plot.py \
#     ../iterations_search_1/cumulative/its_1_2_and_3/round2/pharmgkb_randsub_4000_avg.csv \
#     r1 num_batch_negs num_uniform_negs \
#     batch_size -eq 500 &
