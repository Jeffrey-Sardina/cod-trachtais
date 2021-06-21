#!/bin/bash

# For overnight batches of commands that should be independent of each other
# For example: ./run_round_search_1s.sh 2 4000 3

PARTITIONS=$1 #Num partitions to use
TRIPLES=$2 #Num triples to use in subset
ITERATIONS=$3 #Num iterations to run

START_TIME="$(date +%s)"
START_DATE="$(date)"

for ITERATION in $( seq 1 $ITERATIONS )
do
    #Make dest folders
    mkdir ../iterations_search_1/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part
    mkdir ../iterations_search_1/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/copies
    mkdir ../iterations_search_1/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/models
    mkdir ../iterations_search_1/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/backups

    #Run code for round 3
    ./run_round_search_1.sh 3 $PARTITIONS $TRIPLES > round3.runlog

    #Move to dest
    mv ../models/* ../iterations_search_1/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/models
    mv backup_points/* ../iterations_search_1/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/backups
    mv ../copies/*_randsub_* ../iterations_search_1/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/copies
    mv round3.runlog ../iterations_search_1/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/round3.runlog
done

#Aschuir eolas deiridh
RUNNING_TIME=$[ $(date +%s) - ${START_TIME} ]
END_DATE="$(date)"

echo "eolas deiridh"
echo START_TIME $START_TIME
echo RUNNING_TIME $RUNNING_TIME
echo START_DATE $START_DATE
echo END_DATE $END_DATE
echo 'críochnathe tar éis' $RUNNING_TIME 'soicind'

exit 0
