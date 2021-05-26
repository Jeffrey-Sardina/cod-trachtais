#!/bin/bash

source pytorch-biggraph-gpu/bin/activate

DATA=$1 
DEL_OLD_TSV=$2
DEL_UNCOMPRESSED=$3
MAKE_TSVS=$4

START_TIME="$(date +%s)"
START_DATE="$(date)"

echo 'ag lódáil sonraí' #Gan / i ndiaidh $DATA
./to_compressed_nt.sh ../copies/$DATA 1 $MAKE_TSVS
if [[ $? -ne "0" ]]
then
    echo 'to_compressed_nt.sh error: stopping script'
    exit 1
fi

#Ná scrios an rud seachas amháin má bhí bua ag to_compressed_nt
if [[ $DEL_UNCOMPRESSED -eq "1" ]]
then
    echo 'ag scriosadh sonraí nach bhfuil comhbhrúite'
    mv ../copies/$DATA/all_compressed.tsv ../copies/$DATA/all_compressed.save
    mv ../copies/$DATA/all_table.tsv ../copies/$DATA/all_table.save
    rm ../copies/$DATA/*.tsv
    rm ../copies/$DATA/*.nq*
    mv ../copies/$DATA/all_compressed.save ../copies/$DATA/all_compressed.tsv
    mv ../copies/$DATA/all_table.save ../copies/$DATA/all_table.tsv
fi

RUNNING_TIME=$[ $(date +%s) - ${START_TIME} ]
END_DATE="$(date)"

echo DATA $DATA
echo DEL_OLD_TSV $DEL_OLD_TSV
echo DEL_UNCOMPRESSED $DEL_UNCOMPRESSED
echo START_TIME $START_TIME
echo RUNNING_TIME $RUNNING_TIME
echo START_DATE $START_DATE
echo END_DATE $END_DATE
echo 'críochnathe tar éis' $RUNNING_TIME 'soicind'

exit 0
