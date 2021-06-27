#!/bin/bash

# ./pbg_pipeline.sh dbsnp \
#     final \
#     1 \
#     2 \ #had been 1
#     config/final_1_general.py \
#     2 > dbsnp_final_1.runlog

# ./pbg_pipeline.sh drugbank \
#     final \
#     1 \
#     2 \
#     config/final_1_general.py \
#     2 > drugbank_final_1.runlog

# ./pbg_pipeline.sh omim \
#     final \
#     1 \
#     2 \
#     config/final_1_general.py \
#     2 > omim_final_1.runlog

# ./pbg_pipeline.sh pharmgkb \
#     final \
#     1 \
#     2 \
#     config/final_1_general.py \
#     2 > pharmgkb_final_1.runlog

#Failed on 3, 4
# ./pbg_pipeline.sh bioportal \
#     final \
#     1 \
#     2 \
#     config/final_1_bioportal_rank.py \
#     5 > bioportal_final_1.runlog

./pbg_pipeline.sh bioportal \
    final \
    0 \
    4 \
    config/final_1_bioportal_rank.py \
    5 > bioportal_final_1_run2.runlog