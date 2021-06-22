#!/bin/bash

#Create summary data for a round

##
python scrape_evallogs.py ../iterations_search_1/it_1/rounds/round3_4000_2part/models/bioportal_randsub_4000/ \
    ../iterations_search_1/it_1/rounds/round3_4000_2part/models/bioportal_randsub_4000/evals.csv \
    2

python scrape_evallogs.py ../iterations_search_1/it_1/rounds/round3_4000_2part/models/dbsnp_randsub_4000/ \
    ../iterations_search_1/it_1/rounds/round3_4000_2part/models/dbsnp_randsub_4000/evals.csv \
    2

python scrape_evallogs.py ../iterations_search_1/it_1/rounds/round3_4000_2part/models/drugbank_randsub_4000/ \
    ../iterations_search_1/it_1/rounds/round3_4000_2part/models/drugbank_randsub_4000/evals.csv \
    2

python scrape_evallogs.py ../iterations_search_1/it_1/rounds/round3_4000_2part/models/omim_randsub_4000/ \
    ../iterations_search_1/it_1/rounds/round3_4000_2part/models/omim_randsub_4000/evals.csv \
    2

python scrape_evallogs.py ../iterations_search_1/it_1/rounds/round3_4000_2part/models/pharmgkb_randsub_4000/ \
    ../iterations_search_1/it_1/rounds/round3_4000_2part/models/pharmgkb_randsub_4000/evals.csv \
    2

##
python scrape_evallogs.py ../iterations_search_1/it_2/rounds/round3_4000_2part/models/bioportal_randsub_4000/ \
    ../iterations_search_1/it_2/rounds/round3_4000_2part/models/bioportal_randsub_4000/evals.csv \
    2

python scrape_evallogs.py ../iterations_search_1/it_2/rounds/round3_4000_2part/models/dbsnp_randsub_4000/ \
    ../iterations_search_1/it_2/rounds/round3_4000_2part/models/dbsnp_randsub_4000/evals.csv \
    2

python scrape_evallogs.py ../iterations_search_1/it_2/rounds/round3_4000_2part/models/drugbank_randsub_4000/ \
    ../iterations_search_1/it_2/rounds/round3_4000_2part/models/drugbank_randsub_4000/evals.csv \
    2

python scrape_evallogs.py ../iterations_search_1/it_2/rounds/round3_4000_2part/models/omim_randsub_4000/ \
    ../iterations_search_1/it_2/rounds/round3_4000_2part/models/omim_randsub_4000/evals.csv \
    2

python scrape_evallogs.py ../iterations_search_1/it_2/rounds/round3_4000_2part/models/pharmgkb_randsub_4000/ \
    ../iterations_search_1/it_2/rounds/round3_4000_2part/models/pharmgkb_randsub_4000/evals.csv \
    2

##
python scrape_evallogs.py ../iterations_search_1/it_3/rounds/round3_4000_2part/models/bioportal_randsub_4000/ \
    ../iterations_search_1/it_3/rounds/round3_4000_2part/models/bioportal_randsub_4000/evals.csv \
    2

python scrape_evallogs.py ../iterations_search_1/it_3/rounds/round3_4000_2part/models/dbsnp_randsub_4000/ \
    ../iterations_search_1/it_3/rounds/round3_4000_2part/models/dbsnp_randsub_4000/evals.csv \
    2

python scrape_evallogs.py ../iterations_search_1/it_3/rounds/round3_4000_2part/models/drugbank_randsub_4000/ \
    ../iterations_search_1/it_3/rounds/round3_4000_2part/models/drugbank_randsub_4000/evals.csv \
    2

python scrape_evallogs.py ../iterations_search_1/it_3/rounds/round3_4000_2part/models/omim_randsub_4000/ \
    ../iterations_search_1/it_3/rounds/round3_4000_2part/models/omim_randsub_4000/evals.csv \
    2

python scrape_evallogs.py ../iterations_search_1/it_3/rounds/round3_4000_2part/models/pharmgkb_randsub_4000/ \
    ../iterations_search_1/it_3/rounds/round3_4000_2part/models/pharmgkb_randsub_4000/evals.csv \
    2

##
cp ../iterations_search_1/it_1/rounds/round3_4000_2part/models/bioportal_randsub_4000/evals.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/bioportal_randsub_4000_1.csv

cp ../iterations_search_1/it_1/rounds/round3_4000_2part/models/dbsnp_randsub_4000/evals.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/dbsnp_randsub_4000_1.csv

cp ../iterations_search_1/it_1/rounds/round3_4000_2part/models/drugbank_randsub_4000/evals.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/drugbank_randsub_4000_1.csv

cp ../iterations_search_1/it_1/rounds/round3_4000_2part/models/omim_randsub_4000/evals.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/omim_randsub_4000_1.csv

cp ../iterations_search_1/it_1/rounds/round3_4000_2part/models/pharmgkb_randsub_4000/evals.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/pharmgkb_randsub_4000_1.csv


##
cp ../iterations_search_1/it_2/rounds/round3_4000_2part/models/bioportal_randsub_4000/evals.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/bioportal_randsub_4000_2.csv

cp ../iterations_search_1/it_2/rounds/round3_4000_2part/models/dbsnp_randsub_4000/evals.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/dbsnp_randsub_4000_2.csv

cp ../iterations_search_1/it_2/rounds/round3_4000_2part/models/drugbank_randsub_4000/evals.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/drugbank_randsub_4000_2.csv

cp ../iterations_search_1/it_2/rounds/round3_4000_2part/models/omim_randsub_4000/evals.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/omim_randsub_4000_2.csv

cp ../iterations_search_1/it_2/rounds/round3_4000_2part/models/pharmgkb_randsub_4000/evals.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/pharmgkb_randsub_4000_2.csv


##
cp ../iterations_search_1/it_3/rounds/round3_4000_2part/models/bioportal_randsub_4000/evals.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/bioportal_randsub_4000_3.csv

cp ../iterations_search_1/it_3/rounds/round3_4000_2part/models/dbsnp_randsub_4000/evals.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/dbsnp_randsub_4000_3.csv

cp ../iterations_search_1/it_3/rounds/round3_4000_2part/models/drugbank_randsub_4000/evals.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/drugbank_randsub_4000_3.csv

cp ../iterations_search_1/it_3/rounds/round3_4000_2part/models/omim_randsub_4000/evals.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/omim_randsub_4000_3.csv

cp ../iterations_search_1/it_3/rounds/round3_4000_2part/models/pharmgkb_randsub_4000/evals.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/pharmgkb_randsub_4000_3.csv


cat ../iterations_search_1/cumulative/its_1_2_and_3/round3/bioportal_randsub_4000_?.csv \
    > ../iterations_search_1/cumulative/its_1_2_and_3/round3/bioportal_randsub_4000_all.csv

cat ../iterations_search_1/cumulative/its_1_2_and_3/round3/dbsnp_randsub_4000_?.csv \
    > ../iterations_search_1/cumulative/its_1_2_and_3/round3/dbsnp_randsub_4000_all.csv

cat ../iterations_search_1/cumulative/its_1_2_and_3/round3/drugbank_randsub_4000_?.csv \
    > ../iterations_search_1/cumulative/its_1_2_and_3/round3/drugbank_randsub_4000_all.csv

cat ../iterations_search_1/cumulative/its_1_2_and_3/round3/omim_randsub_4000_?.csv \
    > ../iterations_search_1/cumulative/its_1_2_and_3/round3/omim_randsub_4000_all.csv

cat ../iterations_search_1/cumulative/its_1_2_and_3/round3/pharmgkb_randsub_4000_?.csv \
    > ../iterations_search_1/cumulative/its_1_2_and_3/round3/pharmgkb_randsub_4000_all.csv

##
python average_evals.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/bioportal_randsub_4000_ranking_avg.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/bioportal_randsub_4000_ranking_sd.csv \
    2 \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/bioportal_randsub_4000_1.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/bioportal_randsub_4000_2.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/bioportal_randsub_4000_3.csv

python average_evals.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/dbsnp_randsub_4000_avg.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/dbsnp_randsub_4000_sd.csv \
    2 \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/dbsnp_randsub_4000_1.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/dbsnp_randsub_4000_2.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/dbsnp_randsub_4000_3.csv

python average_evals.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/drugbank_randsub_4000_avg.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/drugbank_randsub_4000_sd.csv \
    2 \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/drugbank_randsub_4000_1.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/drugbank_randsub_4000_2.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/drugbank_randsub_4000_3.csv

python average_evals.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/omim_randsub_4000_avg.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/omim_randsub_4000_sd.csv \
    2 \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/omim_randsub_4000_1.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/omim_randsub_4000_2.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/omim_randsub_4000_3.csv

python average_evals.py \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/pharmgkb_randsub_4000_avg.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/pharmgkb_randsub_4000_sd.csv \
    2 \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/pharmgkb_randsub_4000_1.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/pharmgkb_randsub_4000_2.csv \
    ../iterations_search_1/cumulative/its_1_2_and_3/round3/pharmgkb_randsub_4000_3.csv
