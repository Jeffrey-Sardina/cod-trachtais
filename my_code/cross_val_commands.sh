#!/bin/bash

python cross_val_plot.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/bioportal_randsub_4000_avg.csv \
    r1 epochs dimensions &

# python cross_val_plot.py \
#     ../iterations_search_1/cumulative/its_1_2_and_3/round3/dbsnp_randsub_4000_avg.csv \
#     r1 epochs dimensions &

# python cross_val_plot.py \
#     ../iterations_search_1/cumulative/its_1_2_and_3/round3/drugbank_randsub_4000_avg.csv \
#     r1 epochs dimensions &

# python cross_val_plot.py \
#     ../iterations_search_1/cumulative/its_1_2_and_3/round3/omim_randsub_4000_avg.csv \
#     r1 epochs dimensions &

# python cross_val_plot.py \
#     ../iterations_search_1/cumulative/its_1_2_and_3/round3/pharmgkb_randsub_4000_avg.csv \
#     r1 epochs dimensions &