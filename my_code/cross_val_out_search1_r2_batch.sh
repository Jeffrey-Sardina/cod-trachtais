#!/bin/bash

mkdir metric_analysis/dissertation_report/round2/
mkdir metric_analysis/dissertation_report/round2/r1_search/

BATCH_SIZE=500
    echo $BATCH_SIZE
    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh bioportal \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE

    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh dbsnp \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE

    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh drugbank \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE

    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh omim \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE

    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh pharmgkb \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE

BATCH_SIZE=1000
    echo $BATCH_SIZE
    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh bioportal \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE

    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh dbsnp \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE

    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh drugbank \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE

    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh omim \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE

    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh pharmgkb \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE

BATCH_SIZE=1500
    echo $BATCH_SIZE
    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh bioportal \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE

    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh dbsnp \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE

    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh drugbank \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE

    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh omim \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE

    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh pharmgkb \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE

BATCH_SIZE=2000
    echo $BATCH_SIZE
    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh bioportal \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE

    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh dbsnp \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE

    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh drugbank \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE

    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh omim \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE

    mkdir metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE
    ./cross_val_out_search1_r2.sh pharmgkb \
        metric_analysis/dissertation_report/round2/r1_search/batchsize_$BATCH_SIZE \
        $BATCH_SIZE
