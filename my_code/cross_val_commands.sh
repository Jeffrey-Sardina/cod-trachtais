#!/bin/bash

echo bioportal
python cross_val_plot.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/bioportal_randsub_4000_ranking_all.csv \
    r1 lr-log reg-log \
    operator -eq translation \
    loss_fn -eq softmax \
    comparator -eq l2

