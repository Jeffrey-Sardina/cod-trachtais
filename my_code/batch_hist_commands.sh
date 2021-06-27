#!/bin/bash

python create_hist.py \
    metric_analysis/histograms/bioportal/repeats_freqs.tsv\
    0 1 \
    500\
    0 \
    91058582 &

python create_hist.py \
    metric_analysis/histograms/dbsnp/repeats_freqs.tsv\
    0 1 \
    500\
    0 \
    12633560 &

python create_hist.py \
    metric_analysis/histograms/drugbank/repeats_freqs.tsv\
    0 1 \
    500\
    0 \
    6497964 &

python create_hist.py \
    metric_analysis/histograms/omim/repeats_freqs.tsv\
    0 1 \
    500\
    0 \
    10504995 &

python create_hist.py \
    metric_analysis/histograms/pharmgkb/repeats_freqs.tsv\
    0 1 \
    500\
    0 \
    7113312 &
