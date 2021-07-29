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

# ./pbg_pipeline.sh bioportal \
#     final \
#     0 \
#     4 \
#     config/final_1_bioportal_rank.py \
#     5 > bioportal_final_1_run2.runlog


##Testing on new datasets not used in validation
#Failed on 2,3
# ./pbg_pipeline.sh goa \
#     final_4part \
#     0 \
#     2 \
#     config/final_1_general.py \
#     4 > goa_final_1.runlog

# ./pbg_pipeline.sh hgnc \
#     final \
#     0 \
#     2 \
#     config/final_1_general.py \
#     1 > hgnc_final.runlog

# ./pbg_pipeline.sh lsr \
#     final \
#     0 \
#     2 \
#     config/final_1_general.py \
#     1 > lsr_final.runlog

# ./pbg_pipeline.sh lsr \
#     final \
#     0 \
#     2 \
#     config/final_1_bioportal_rank.py \
#     1 > lsr_final.runlog

# ./pbg_pipeline.sh hgnc \
#     final \
#     0 \
#     2 \
#     config/final_1_bioportal_rank.py \
#     1 > hgnc_final.runlog

# ./pbg_pipeline.sh lsr \
#     final_2part \
#     0 \
#     2 \
#     config/final_1_general.py \
#     2 > lsr_final.runlog

# ./pbg_pipeline.sh lsr \
#     final_2part \
#     0 \
#     2 \
#     config/final_1_bioportal_rank.py \
#     2 > lsr_final.runlog

#Failed on 4, 5 (ar epoch 23)
# ./pbg_pipeline.sh goa \
#     final_4part_bioconf \
#     0 \
#     3 \
#     config/final_1_bioportal_rank.py \
#     5 > goa_final_1.runlog

# ./pbg_pipeline.sh hgnc \
#     final_2part \
#     0 \
#     2 \
#     config/final_1_general.py \
#     2 > hgnc_final.runlog

# ./pbg_pipeline.sh hgnc \
#     final_2part_bioconf \
#     0 \
#     2 \
#     config/final_1_bioportal_rank.py \
#     2 > hgnc_final.runlog

# ./pbg_pipeline.sh bioportal \
#     final_search0conf \
#     0 \
#     2 \
#     config/final.py \
#     3 > bioportal.runlog

#Failed on 4, 5 (ar epoch 23)
# export TORCH_USE_RTLD_GLOBAL=1
# ./pbg_pipeline.sh goa \
#     final_4part_bioconf \
#     0 \
#     3 \
#     config/final_1_bioportal_rank.py \
#     6 > goa_final_1.runlog

# #Failed on 2, 3
# export TORCH_USE_RTLD_GLOBAL=1
# ./pbg_pipeline.sh kegg \
#     final_3part_bioconf \
#     0 \
#     4 \
#     config/final_1_bioportal_rank.py \
#     9 > kegg_final_1.runlog

#Failed on 4, 
export TORCH_USE_RTLD_GLOBAL=1
./pbg_pipeline.sh kegg \
    final_general \
    0 \
    2 \
    config/final.py \
    5 > kegg_final_1.runlog
