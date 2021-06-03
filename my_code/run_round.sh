#!/bin/bash

# For overnight batches of commands that should be independent of each other

ROUND=$1
PARTITIONS=$2
TRIPLES=$3

START_TIME="$(date +%s)"
START_DATE="$(date)"

if [[ $ROUND -eq 1 ]]
then
    ./hyperparam_search.sh bioportal 1 $PARTITIONS 84 config/search/general.py $TRIPLES 0
    exit_1=$?

    ./hyperparam_search.sh dbsnp 1 $PARTITIONS 84 config/search/general.py $TRIPLES 0
    exit_2=$?

    ./hyperparam_search.sh drugbank 1 $PARTITIONS 84 config/search/general.py $TRIPLES 0
    exit_3=$?

    ./hyperparam_search.sh omim 1 $PARTITIONS 84 config/search/general.py $TRIPLES 0
    exit_4=$?

    ./hyperparam_search.sh pharmgkb 1 $PARTITIONS 84 config/search/general.py $TRIPLES 0
    exit_5=$?
fi

if [[ $ROUND -eq 2 ]]
then
    ./hyperparam_search.sh bioportal 1 $PARTITIONS 100 config/search/batches_2.py $TRIPLES 0
    exit_1=$?

    ./hyperparam_search.sh dbsnp 1 $PARTITIONS 100 config/search/batches_2.py $TRIPLES 0
    exit_2=$?

    ./hyperparam_search.sh drugbank 1 $PARTITIONS 100 config/search/batches_2.py $TRIPLES 0
    exit_3=$?

    ./hyperparam_search.sh omim 1 $PARTITIONS 100 config/search/batches_2.py $TRIPLES 0
    exit_4=$?

    ./hyperparam_search.sh pharmgkb 1 $PARTITIONS 100 config/search/batches_2.py $TRIPLES 0
    exit_5=$?
fi

if [[ $ROUND -eq 3 ]]
then
    ./hyperparam_search.sh bioportal 1 $PARTITIONS 16 config/search/epochs_3.py $TRIPLES 0
    exit_1=$?

    ./hyperparam_search.sh dbsnp 1 $PARTITIONS 16 config/search/epochs_3.py $TRIPLES 0
    exit_2=$?

    ./hyperparam_search.sh drugbank 1 $PARTITIONS 16 config/search/epochs_3.py $TRIPLES 0
    exit_3=$?

    ./hyperparam_search.sh omim 1 $PARTITIONS 16 config/search/epochs_3.py $TRIPLES 0
    exit_4=$?

    ./hyperparam_search.sh pharmgkb 1 $PARTITIONS 16 config/search/epochs_3.py $TRIPLES 0
    exit_5=$?
fi

echo exit_1 $exit_1
echo exit_2 $exit_2
echo exit_3 $exit_3
echo exit_4 $exit_4
echo exit_5 $exit_5

RUNNING_TIME=$[ $(date +%s) - ${START_TIME} ]
END_DATE="$(date)"

echo "eolas deiridh"
echo START_TIME $START_TIME
echo RUNNING_TIME $RUNNING_TIME
echo START_DATE $START_DATE
echo END_DATE $END_DATE
echo 'críochnathe tar éis' $RUNNING_TIME 'soicind'

exit 0
