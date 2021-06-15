#!/bin/bash
python average_evals.py \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/bioportal_randsub_4000_avg.csv \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/bioportal_randsub_4000_std.csv \
    5 \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/bioportal_randsub_4000_1.csv \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/bioportal_randsub_4000_2.csv \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/bioportal_randsub_4000_3.csv

python average_evals.py \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/dbsnp_randsub_4000_avg.csv \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/dbsnp_randsub_4000_std.csv \
    5 \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/dbsnp_randsub_4000_1.csv \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/dbsnp_randsub_4000_2.csv \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/dbsnp_randsub_4000_3.csv

python average_evals.py \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/drugbank_randsub_4000_avg.csv \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/drugbank_randsub_4000_std.csv \
    5 \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/drugbank_randsub_4000_1.csv \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/drugbank_randsub_4000_2.csv \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/drugbank_randsub_4000_3.csv

python average_evals.py \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/omim_randsub_4000_avg.csv \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/omim_randsub_4000_std.csv \
    5 \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/omim_randsub_4000_1.csv \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/omim_randsub_4000_2.csv \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/omim_randsub_4000_3.csv

python average_evals.py \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/pharmgkb_randsub_4000_avg.csv \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/pharmgkb_randsub_4000_std.csv \
    5 \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/pharmgkb_randsub_4000_1.csv \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/pharmgkb_randsub_4000_2.csv \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/pharmgkb_randsub_4000_3.csv
