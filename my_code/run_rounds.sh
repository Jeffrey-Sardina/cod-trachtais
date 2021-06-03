#!/bin/bash

# For overnight batches of commands that should be independent of each other

PARTITIONS=$1
TRIPLES=$2
ITERATION=$3

START_TIME="$(date +%s)"
START_DATE="$(date)"

if [[ -d ../iterations/it_${ITERATION} ]]
then
    'output folder already exists, exiting'
    exit 1
else
    mkdir ../iterations/it_${ITERATION}
    mkdir ../iterations/it_${ITERATION}/rounds
fi

#Run code for round 1
./run_round.sh 1 $PARTITIONS $TRIPLES > round1.runlog

#Make dest folders
mkdir ../iterations/it_${ITERATION}/rounds/round1_${TRIPLES}_${PARTITIONS}part
mkdir ../iterations/it_${ITERATION}/rounds/round1_${TRIPLES}_${PARTITIONS}part/copies
mkdir ../iterations/it_${ITERATION}/rounds/round1_${TRIPLES}_${PARTITIONS}part/models
mkdir ../iterations/it_${ITERATION}/rounds/round1_${TRIPLES}_${PARTITIONS}part/backups

#Move to dest
mv ../models/* ../iterations/it_${ITERATION}/rounds/round1_${TRIPLES}_${PARTITIONS}part/models
mv backup_points/* ../iterations/it_${ITERATION}/rounds/round1_${TRIPLES}_${PARTITIONS}part/backups
mv ../copies/*_randsub_* ../iterations/it_${ITERATION}/rounds/round1_${TRIPLES}_${PARTITIONS}part/copies
mv round1.runlog ../iterations/it_${ITERATION}/rounds/round1_${TRIPLES}_${PARTITIONS}part/round1.runlog

#Run code for round 2
./run_round.sh 2 $PARTITIONS $TRIPLES > round2.runlog

#Make dest folders
mkdir ../iterations/it_${ITERATION}/rounds/round2_${TRIPLES}_${PARTITIONS}part
mkdir ../iterations/it_${ITERATION}/rounds/round2_${TRIPLES}_${PARTITIONS}part/copies
mkdir ../iterations/it_${ITERATION}/rounds/round2_${TRIPLES}_${PARTITIONS}part/models
mkdir ../iterations/it_${ITERATION}/rounds/round2_${TRIPLES}_${PARTITIONS}part/backups

#Move to dest
mv ../models/* ../iterations/it_${ITERATION}/rounds/round2_${TRIPLES}_${PARTITIONS}part/models
mv backup_points/* ../iterations/it_${ITERATION}/rounds/round2_${TRIPLES}_${PARTITIONS}part/backups
mv ../copies/*_randsub_* ../iterations/it_${ITERATION}/rounds/round2_${TRIPLES}_${PARTITIONS}part/copies
mv round2.runlog ../iterations/it_${ITERATION}/rounds/round2_${TRIPLES}_${PARTITIONS}part/round2.runlog

#Run code for round 3
./run_round.sh 3 $PARTITIONS $TRIPLES > round3.runlog

#Make dest folders
mkdir ../iterations/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part
mkdir ../iterations/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/copies
mkdir ../iterations/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/models
mkdir ../iterations/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/backups

#Move to dest
mv ../models/* ../iterations/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/models
mv backup_points/* ../iterations/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/backups
mv ../copies/*_randsub_* ../iterations/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/copies
mv round3.runlog ../iterations/it_${ITERATION}/rounds/round3_${TRIPLES}_${PARTITIONS}part/round3.runlog

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
