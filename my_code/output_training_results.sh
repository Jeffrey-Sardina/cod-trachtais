#!/bin/bash

#Use this to output, but not to train; it is behind Master by a bit
source pytorch-biggraph-gpu-writepatch/bin/activate

DATA=$1 
CONFIG=$2

echo 'ag aschur an eolais mar .tsv'
mkdir ../copies/$DATA/pbg_out/
torchbiggraph_export_to_tsv \
    $CONFIG \
    --entities-output ../copies/$DATA/pbg_out/entity_embeddings.tsv \
    --relation-types-output ../copies/$DATA/pbg_out/relation_types_parameters.tsv
if [[ $? -ne "0" ]]
then
    echo 'torchbiggraph_export_to_tsv error: stopping script'
    exit 1
fi

echo 'ag scríobh eolais díchomhbhrúite'
python uncompress.py ../copies/$DATA/pbg_out/entity_embeddings.tsv ../copies/$DATA/all_table.tsv ../copies/$DATA/pbg_out/entity_embeddings_uncompressed.tsv
if [[ $? -ne "0" ]]
then
    echo 'uncompress.py (on entity_embeddings) error: stopping script'
    exit 1
fi

python uncompress.py ../copies/$DATA/pbg_out/relation_types_parameters.tsv ../copies/$DATA/all_table.tsv ../copies/$DATA/pbg_out/relation_types_parameters_uncompressed.tsv
if [[ $? -ne "0" ]]
then
    echo 'uncompress.py (on relation_types_parameters) error: stopping script'
    exit 1
fi
