#!/bin/bash

DATA=$1 
CONFIG=$2
UUID='2_0'

export DATA=$DATA
export UUID=$UUID
export NUM_PARTITIONS=2

echo 'ag aschur an eolais mar .tsv'
mkdir temp/out_test/
torchbiggraph_export_to_tsv \
    $CONFIG \
    --entities-output temp/out_test/entity_embeddings.tsv \
    --relation-types-output temp/out_test/relation_types_parameters.tsv
if [[ $? -ne "0" ]]
then
    echo 'torchbiggraph_export_to_tsv error: stopping script'
    exit 1
fi
