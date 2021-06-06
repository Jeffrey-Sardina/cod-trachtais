#!/bin/bash

DATA=$1 
CONFIG=$2
UUID='temp'

export DATA=$DATA
export UUID=$UUID
export NUM_PARTITIONS=2

echo 'ag aschur an eolais mar .tsv'
mkdir temp/out_test/$DATA/
mkdir temp/out_test/$DATA/$UUID/
mkdir temp/out_test/$DATA/$UUID/pbg_out/
torchbiggraph_export_to_tsv \
    $CONFIG \
    --entities-output temp/out_test/$DATA/$UUID/pbg_out/entity_embeddings.tsv \
    --relation-types-output temp/out_test/$DATA/$UUID/pbg_out/relation_types_parameters.tsv
if [[ $? -ne "0" ]]
then
    echo 'torchbiggraph_export_to_tsv error: stopping script'
    exit 1
fi
