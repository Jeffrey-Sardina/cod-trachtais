#!/bin/bash

DATASET=$1
OUTPUT_FOLDER=$2
BATCH_SIZE=$3

if [[ $DATASET == 'bioportal' ]]
then
    FILE=${DATASET}_randsub_4000_ranking_avg.csv
else
    FILE=${DATASET}_randsub_4000_avg.csv
fi

python cross_val_plot.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/$FILE \
    r1 num_batch_negs num_uniform_negs \
    $OUTPUT_FOLDER \
    1 0 1 \
    batch_size -eq $BATCH_SIZE
