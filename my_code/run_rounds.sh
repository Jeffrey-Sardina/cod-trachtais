#!/bin/bash

# For overnight batches of commands that should be independent of each other
# For example: ./run_rounds.sh 2 4000 3

PARTITIONS=$1 #Num partitions to use
TRIPLES=$2 #Num triples to use in subset
ITERATION=$3 #Just an ID

START_TIME="$(date +%s)"
START_DATE="$(date)"

if [[ -d ../iterations_search_0/it_${ITERATION} ]]
then
    'output folder already exists, exiting'
    exit 1
else
    mkdir ../iterations_search_0/it_${ITERATION}
    mkdir ../iterations_search_0/it_${ITERATION}/rounds
fi

echo 'Running code for round 1'
./run_round.sh 1 $PARTITIONS $TRIPLES > round1.runlog

echo 'Make dest folders'
mkdir ../iterations_search_0/it_${ITERATION}/rounds/round1_${TRIPLES}_${PARTITIONS}part
mkdir ../iterations_search_0/it_${ITERATION}/rounds/round1_${TRIPLES}_${PARTITIONS}part/copies
mkdir ../iterations_search_0/it_${ITERATION}/rounds/round1_${TRIPLES}_${PARTITIONS}part/models
mkdir ../iterations_search_0/it_${ITERATION}/rounds/round1_${TRIPLES}_${PARTITIONS}part/backups

echo 'Moving data to dest folders'
mv ../models/* ../iterations_search_0/it_${ITERATION}/rounds/round1_${TRIPLES}_${PARTITIONS}part/models
mv backup_points/* ../iterations_search_0/it_${ITERATION}/rounds/round1_${TRIPLES}_${PARTITIONS}part/backups
mv ../copies/*_randsub_* ../iterations_search_0/it_${ITERATION}/rounds/round1_${TRIPLES}_${PARTITIONS}part/copies
mv round1.runlog ../iterations_search_0/it_${ITERATION}/rounds/round1_${TRIPLES}_${PARTITIONS}part/round1.runlog

#Run code for round 2
./run_round.sh 2 $PARTITIONS $TRIPLES > round2.runlog

#Make dest folders
mkdir ../iterations_search_0/it_${ITERATION}/rounds/round2_${TRIPLES}_${PARTITIONS}part
mkdir ../iterations_search_0/it_${ITERATION}/rounds/round2_${TRIPLES}_${PARTITIONS}part/copies
mkdir ../iterations_search_0/it_${ITERATION}/rounds/round2_${TRIPLES}_${PARTITIONS}part/models
mkdir ../iterations_search_0/it_${ITERATION}/rounds/round2_${TRIPLES}_${PARTITIONS}part/backups

#Move to dest
mv ../models/* ../iterations_search_0/it_${ITERATION}/rounds/round2_${TRIPLES}_${PARTITIONS}part/models
mv backup_points/* ../iterations_search_0/it_${ITERATION}/rounds/round2_${TRIPLES}_${PARTITIONS}part/backups
mv ../copies/*_randsub_* ../iterations_search_0/it_${ITERATION}/rounds/round2_${TRIPLES}_${PARTITIONS}part/copies
mv round2.runlog ../iterations_search_0/it_${ITERATION}/rounds/round2_${TRIPLES}_${PARTITIONS}part/round2.runlog

#Run code for round 3
./run_round.sh 3 $PARTITIONS $TRIPLES > round3.runlog

#Make dest folders
mkdir ../iterations_search_0/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part
mkdir ../iterations_search_0/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/copies
mkdir ../iterations_search_0/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/models
mkdir ../iterations_search_0/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/backups

#Move to dest
mv ../models/* ../iterations_search_0/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/models
mv backup_points/* ../iterations_search_0/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/backups
mv ../copies/*_randsub_* ../iterations_search_0/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/copies
mv round3.runlog ../iterations_search_0/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/round3.runlog

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
