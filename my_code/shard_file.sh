#!/bin/bash

FILE=$1
NUM_SHARDS=$2
WORK_DIR=$3

CURR_DIR=$(pwd)
cd $WORK_DIR
TOTAL_LINES=$(wc -l < $FILE)
let NUM_LINES=1+$TOTAL_LINES/$NUM_SHARDS
split -l $NUM_LINES $FILE -u --additional-suffix=.shard
if [[ $? -ne "0" ]]
then
    echo 'split cmd error: stopping script'
    exit 1
fi
cd $CURR_DIR

exit 0
