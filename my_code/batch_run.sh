#!/bin/bash

# For overnight batches of commands that should be independent of each other

START_TIME="$(date +%s)"
START_DATE="$(date)"

#10000 triples, only 2 partitions
./hyperparam_search.sh bioportal 1 2 16 config/search/epochs_3.py 10000 0
exit_6=$?

./hyperparam_search.sh dbsnp 1 2 16 config/search/epochs_3.py 10000 0
exit_7=$?

./hyperparam_search.sh drugbank 1 2 16 config/search/epochs_3.py 10000 0
exit_8=$?

./hyperparam_search.sh omim 1 2 16 config/search/epochs_3.py 10000 0
exit_9=$?

./hyperparam_search.sh pharmgkb 1 2 16 config/search/epochs_3.py 10000 0
exit_10=$?

echo exit_6 $exit_6
echo exit_7 $exit_7
echo exit_8 $exit_8
echo exit_9 $exit_9
echo exit_10 $exit_10

RUNNING_TIME=$[ $(date +%s) - ${START_TIME} ]
END_DATE="$(date)"

echo "eolas deiridh"
echo START_TIME $START_TIME
echo RUNNING_TIME $RUNNING_TIME
echo START_DATE $START_DATE
echo END_DATE $END_DATE
echo 'críochnathe tar éis' $RUNNING_TIME 'soicind'
