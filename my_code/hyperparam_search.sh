#!/bin/bash

##Goal: do a search on hyperparameters (and model) space to try to find some ideal values
#This code should be read-only wrt the data in ../copies/*

source pytorch-biggraph-gpu/bin/activate

DATA=$1
DEL_OLD=$2
NUM_PARTITIONS=$3
NUM_OPTIONS=$4 #Must be manually calcualted from number of options in the search config file
CONFIG=$5

# for dir in ../copies/*/
# do
#     data=$(basename $dir)
# done

for i in $( seq 1 $NUM_OPTIONS )
do
    let SEARCH_ITERATION=$i-1
    export SEARCH_ITERATION=$SEARCH_ITERATION

    # #Réamh-phróiseáil
    uuid=${NUM_PARTITIONS}_${SEARCH_ITERATION}
    echo $uuid
    # ./pbg_preprocess.sh $DATA $DEL_OLD $CONFIG $NUM_PARTITIONS $uuid
    
    # #Traenáil 7 Fíorú
    # $start=4
    # ./pbg_pipeline.sh $DATA $uuid $DEL_OLD $start $CONFIG $NUM_PARTITIONS
done
