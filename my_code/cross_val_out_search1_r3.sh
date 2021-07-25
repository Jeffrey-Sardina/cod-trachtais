#!/bin/bash

mkdir metric_analysis/dissertation_report/round3/
mkdir metric_analysis/dissertation_report/round3/r1_search/

DATASET=bioportal
python cross_val_plot.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/${DATASET}_randsub_4000_avg.csv \
    r1 epochs dimensions \
    metric_analysis/dissertation_report/round3/r1_search/ \
    1 0 1

DATASET=dbsnp
python cross_val_plot.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/${DATASET}_randsub_4000_avg.csv \
    r1 epochs dimensions \
    metric_analysis/dissertation_report/round3/r1_search/ \
    1 0 1

DATASET=drugbank
python cross_val_plot.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/${DATASET}_randsub_4000_avg.csv \
    r1 epochs dimensions \
    metric_analysis/dissertation_report/round3/r1_search/ \
    1 0 1

DATASET=omim
python cross_val_plot.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/${DATASET}_randsub_4000_avg.csv \
    r1 epochs dimensions \
    metric_analysis/dissertation_report/round3/r1_search/ \
    1 0 1

DATASET=pharmgkb
python cross_val_plot.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/${DATASET}_randsub_4000_avg.csv \
    r1 epochs dimensions \
    metric_analysis/dissertation_report/round3/r1_search/ \
    1 0 1