#!/bin/bash

# For overnight batches of commands that should be independent of each other

START_TIME="$(date +%s)"
START_DATE="$(date)"

./hyperparam_search.sh bioportal 1 2 100 config/search/batches_2.py 4000 0
exit_1=$?

./hyperparam_search.sh dbsnp 1 2 100 config/search/batches_2.py 4000 0
exit_2=$?

./hyperparam_search.sh drugbank 1 2 100 config/search/batches_2.py 4000 0
exit_3=$?

./hyperparam_search.sh omim 1 2 100 config/search/batches_2.py 4000 0
exit_4=$?

./hyperparam_search.sh pharmgkb 1 2 100 config/search/batches_2.py 4000 0
exit_5=$?

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
