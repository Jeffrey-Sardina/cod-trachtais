#!/bin/bash

##Goal: do a search on hyperparameters (and model) space to try to find some ideal values
#This code should be read-only wrt the data in ../copies/*

source pytorch-biggraph-gpu/bin/activate

DATA=$1
DEL_OLD=$2
NUM_PARTITIONS=$3
NUM_OPTIONS=$4 #Must be manually calcualted from number of options in the search config file
CONFIG=$5
TRIPLES_TO_KEEP=$6 #if 0, keep all

export DATA=$1
export NUM_PARTITIONS=$3

# for dir in ../copies/*/
# do
#     data=$(basename $dir)
# done

if [[ $TRIPLES_TO_KEEP -gt 0 ]]
then
    echo 'ag cruthú fothacair eolais go randamach'
    mkdir ../copies/${DATA}_randsub_${TRIPLES_TO_KEEP}/
    DATA_OLD=$DATA
    DATA=${DATA}_randsub_${TRIPLES_TO_KEEP}
    cp ../copies/$DATA_OLD/all_table.tsv ../copies/$DATA/
    python create_random_subset.py ../copies/$DATA_OLD/ ../copies/$DATA/ $TRIPLES_TO_KEEP
    if [[ $? -ne "0" ]]
    then
        echo 'create_random_subset.py error: stopping script'
        exit 1
    fi
fi

#Réamh-phróiseáil
mkdir ../models/$DATA/
./pbg_preprocess_search.sh $DATA $DEL_OLD $CONFIG $NUM_PARTITIONS
if [[ $? -ne "0" ]]
then
    echo 'pbg_preprocess_search.sh error: stopping script'
    exit 1
fi

for i in $( seq 1 $NUM_OPTIONS )
do
    let SEARCH_ITERATION=$i-1
    export SEARCH_ITERATION=$SEARCH_ITERATION
    UUID=${NUM_PARTITIONS}_${SEARCH_ITERATION}
    export UUID=$UUID
    rm -rf ../copies/$DATA/$UUID/pbg_out/

    #Traenáil
    echo 'ag rith algartaim leabaithe'
    torchbiggraph_train \
        $CONFIG \
        -p edge_paths=../copies/$DATA/pbg_split/imported/training_data > "../models/${DATA}/${UUID}.trainlog"
    if [[ $? -ne "0" ]]
    then
        echo 'torchbiggraph_train error: stopping script'
        exit 1
    fi

    #Fíorú
    echo 'ag fíorú na samhlach'
    torchbiggraph_eval \
        $CONFIG \
        -p edge_paths=../copies/$DATA/pbg_split/imported/validation_data \
        -p relations.0.all_negs=false \
        -p num_batch_negs=500 \
        -p num_uniform_negs=500 > "../models/${DATA}/${UUID}.evallog"
    if [[ $? -ne "0" ]]
    then
        echo 'torchbiggraph_eval error: stopping script'
        exit 1
    fi

    #Aschur eolais
    ./output_training_results_search.sh $DATA $CONFIG
    if [[ $? -ne "0" ]]
    then
        echo 'output_training_results_search.sh error: stopping script'
        exit 1
    fi
done

exit 0
