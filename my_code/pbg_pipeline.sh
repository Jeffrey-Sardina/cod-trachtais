#!/bin/bash

# $ 1 => ainm fillteán i "copies/" (ms dbsnp)
# $ 2 => uuid
# $ 3 => scrios seancomhaid (1) nó ná scrios (0)
# $ 4 => áit tosaithe
    # 1 : comhbhrú
    # 2 : réamh-phroiseáil
    # 3 : leabú
    # 4 : scrúdú
    # 5 : aschur mar .tsv agus díchombhrú
# $ 5 : comhad cumraíochta
# $ 6 uimhir "partitions"

source pytorch-biggraph-gpu/bin/activate

# to run: ./pbg_pipeline.sh pharmgkb validated_1 1 2 config/search/final.py

DATA=$1 
UUID=$2
DEL_OLD_TSV=$3
START=$4
CONFIG=$5
START_TIME="$(date +%s)"
START_DATE="$(date)"

export DATA=$1
export NUM_PARTITIONS=$6
export UUID=$2

#Rabhaí agus earráidí
if [[ -d "backup_points/${DATA}_${UUID}" && $START -lt 4 ]]
then
    echo "ERROR: UUID úsáidte cheana, roghnaigh ceann eile"
    exit 1
fi

#Céim 1
if [[ $START -lt 2 ]] 
then
    ./compress_copy.sh $DATA $DEL_OLD_TSV
    if [[ $? -ne "0" ]]
    then
        echo 'compress_copy.sh error: stopping script'
        exit 1
    fi
fi

#Céim 2
if [[ $START -lt 3 ]]
then
    ./pbg_preprocess.sh $DATA $DEL_OLD_TSV $CONFIG $NUM_PARTITIONS $UUID
    if [[ $? -ne "0" ]]
    then
        echo 'pbg_preprocess.sh error: stopping script'
        exit 1
    fi
fi

#Céim 3
if [[ $START -lt 4 ]]
then
    echo 'ag rith algartaim leabaithe'
    torchbiggraph_train \
        $CONFIG \
        -p edge_paths=../copies/$DATA/pbg_split/imported/training_data
    if [[ $? -ne "0" ]]
    then
        echo 'torchbiggraph_train error: stopping script'
        exit 1
    fi
fi

#Céim 4
if [[ $START -lt 5 ]]
then
    #TODO: athrú go testing?
    echo 'ag fíorú na samhlach'
    torchbiggraph_eval \
        $CONFIG \
        -p edge_paths=../copies/$DATA/pbg_split/imported/validation_data \
        -p relations.0.all_negs=false \
        -p num_batch_negs=500 \
        -p num_uniform_negs=500
    if [[ $? -ne "0" ]]
    then
        echo 'torchbiggraph_eval error: stopping script'
        exit 1
    fi
fi

#Céim 5
if [[ $START -lt 6 ]]
then
    ./output_training_results.sh $DATA $CONFIG
    if [[ $? -ne "0" ]]
    then
        echo 'output_training_results.sh error: stopping script'
        exit 1
    fi
fi

RUNNING_TIME=$[ $(date +%s) - ${START_TIME} ]
END_DATE="$(date)"

echo "eolas deiridh"
echo DATA $DATA
echo UUID $UUID 
echo DEL_OLD_TSV $DEL_OLD_TSV 
echo START $START 
echo CONFIG $CONFIG 
echo START_TIME $START_TIME
echo RUNNING_TIME $RUNNING_TIME
echo START_DATE $START_DATE
echo END_DATE $END_DATE
echo 'críochnathe tar éis' $RUNNING_TIME 'soicind'

exit 0
