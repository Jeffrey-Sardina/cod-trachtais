#!/bin/bash

TARGET=$1

#Ranking, diagonal
    LOSS=ranking
    OP=diagonal
    echo $LOSS $OP
    mkdir metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP}

    ./cross_val_out_r1.sh bioportal \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh dbsnp \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh drugbank \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh omim \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh pharmgkb \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

#Softmax diagonal
    LOSS=softmax
    OP=diagonal
    echo $LOSS $OP
    mkdir metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP}

    ./cross_val_out_r1.sh bioportal \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh dbsnp \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh drugbank \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh omim \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh pharmgkb \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET


#Ranking affine
    LOSS=ranking
    OP=affine
    echo $LOSS $OP
    mkdir metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP}

    ./cross_val_out_r1.sh bioportal \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh dbsnp \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh drugbank \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh omim \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh pharmgkb \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

#Softmax affine
    LOSS=softmax
    OP=affine
    echo $LOSS $OP
    mkdir metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP}

    ./cross_val_out_r1.sh bioportal \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh dbsnp \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh drugbank \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh omim \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh pharmgkb \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

#Ranking translation
    LOSS=ranking
    OP=translation
    echo $LOSS $OP
    mkdir metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP}

    ./cross_val_out_r1.sh bioportal \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh dbsnp \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh drugbank \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh omim \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh pharmgkb \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

#Softmax translation
    LOSS=softmax
    OP=translation
    echo $LOSS $OP
    mkdir metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP}

    ./cross_val_out_r1.sh bioportal \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh dbsnp \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh drugbank \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh omim \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET

    ./cross_val_out_r1.sh pharmgkb \
        metric_analysis/dissertation_report/round1/${TARGET}_search/${LOSS}_${OP} \
        $LOSS\
        $OP\
        $TARGET