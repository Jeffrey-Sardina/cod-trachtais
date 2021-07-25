#!/bin/bash

DATASET=$1
OUTPUT_FOLDER=$2
LOSS=$3
OP=$4
TARGET=$5

python cross_val_plot.py \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/${DATASET}_randsub_4000_avg.csv \
    $TARGET lr reg \
    $OUTPUT_FOLDER \
    1 0 1 \
    loss_fn -eq $LOSS \
    operator -eq $OP \
    comparator -eq dot

python cross_val_plot.py \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/${DATASET}_randsub_4000_avg.csv \
    $TARGET lr reg \
    $OUTPUT_FOLDER \
    1 0 1 \
    loss_fn -eq $LOSS \
    operator -eq $OP \
    comparator -eq l2
