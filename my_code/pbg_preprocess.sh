#!/bin/bash

DATA=$1 
DEL_OLD=$2
CONFIG=$3
NUM_PARTITIONS=$4
UUID=$5

export DATA=$1
export NUM_PARTITIONS=$4
export UUID=$5

#Céim 2
echo 'Preparing the data'
if [[ $DEL_OLD -eq "1" ]]
then
    echo 'ag scriosadh seaneolas i pbg_split agus pbg_out'
    rm -rf ../copies/$DATA/pbg_split/
    rm -rf ../copies/$DATA/pbg_out/
fi
mkdir ../copies/$DATA/pbg_split/

python pre_pbg_import.py ../copies/$DATA/all_compressed.tsv ../copies/$DATA/pbg_split/ 0
if [[ $? -ne "0" ]]
then
    echo 'pre_pbg_import.sh error: stopping script'
    exit 1
fi

torchbiggraph_import_from_tsv \
    --lhs-col=0 --rel-col=1 --rhs-col=2 \
    $CONFIG \
    ../copies/$DATA/pbg_split/training_data.tsv \
    ../copies/$DATA/pbg_split/validation_data.tsv \
    ../copies/$DATA/pbg_split/testing_data.tsv
if [[ $? -ne "0" ]]
then
    echo 'torchbiggraph_import_from_tsv error: stopping script'
    exit 1
fi

exit 0
