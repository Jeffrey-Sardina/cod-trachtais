#!/bin/bash

##Goal: do a search on hyperparameters (and model) space to try to find some ideal values
#This code should be read-only wrt the data in ../copies/*

source pytorch-biggraph-gpu/bin/activate

DATA=$1
DEL_OLD=$2
NUM_PARTITIONS=$3
NUM_OPTIONS=$4 #Must be manually calcualted from number of options in the search config file
CONFIG=$5

export DATA=$1
export NUM_PARTITIONS=$3

# for dir in ../copies/*/
# do
#     data=$(basename $dir)
# done

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
        echo 'output_training_results_search.sh.sh error: stopping script'
        exit 1
    fi
done

exit 0
