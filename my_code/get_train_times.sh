#!/bin/bash

MAX=$1
FOLDER=$2
NUM_SPLTS=$3

for i in $( seq 0 $MAX )
do
    python3 get_train_time.py $FOLDER/${NUM_SPLTS}_${i}.trainlog 0
done
