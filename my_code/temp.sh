#!/bin/bash

python average_evals.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/bioportal_randsub_4000_ranking_avg.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/bioportal_randsub_4000_ranking_sd.csv \
    3 \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/bioportal_randsub_4000_ranking_1.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/bioportal_randsub_4000_ranking_2.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/bioportal_randsub_4000_ranking_3.csv

python average_evals.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/bioportal_randsub_4000_softmax_avg.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/bioportal_randsub_4000_softmax_sd.csv \
    3 \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/bioportal_randsub_4000_softmax_1.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/bioportal_randsub_4000_softmax_2.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/bioportal_randsub_4000_softmax_3.csv

python average_evals.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/dbsnp_randsub_4000_avg.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/dbsnp_randsub_4000_sd.csv \
    3 \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/dbsnp_randsub_4000_1.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/dbsnp_randsub_4000_2.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/dbsnp_randsub_4000_3.csv

python average_evals.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/drugbank_randsub_4000_avg.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/drugbank_randsub_4000_sd.csv \
    3 \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/drugbank_randsub_4000_1.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/drugbank_randsub_4000_2.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/drugbank_randsub_4000_3.csv

python average_evals.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/omim_randsub_4000_avg.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/omim_randsub_4000_sd.csv \
    3 \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/omim_randsub_4000_1.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/omim_randsub_4000_2.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/omim_randsub_4000_3.csv

python average_evals.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/pharmgkb_randsub_4000_avg.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/pharmgkb_randsub_4000_sd.csv \
    3 \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/pharmgkb_randsub_4000_1.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/pharmgkb_randsub_4000_2.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round2/pharmgkb_randsub_4000_3.csv
