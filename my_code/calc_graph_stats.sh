#!/bin/bash

#REF: https://stackoverflow.com/questions/15384818/how-to-get-the-difference-only-additions-between-two-files-in-linux

SOURCE_FILE=$1 #an all.tsv or all_compressed.tsv
WORK_DIR=$2
PRINT_HEADER=$3
SAVE_WORK_FILES=$4

#Comhaid sealadacha
cut $SOURCE_FILE -f1 | sort > $WORK_DIR/col1.tmp
cut $SOURCE_FILE -f3 | sort > $WORK_DIR/col3.tmp

#Comháireamh na slogaidí
comm -13 $WORK_DIR/col1.tmp $WORK_DIR/col3.tmp > $WORK_DIR/sinks.txt
uniq $WORK_DIR/sinks.txt > $WORK_DIR/sinks_uniq.txt
python calc_entity_freqs.py $WORK_DIR/sinks.txt | sort -n > $WORK_DIR/sinks_freqs.tsv

#Comháireamh na bhfoinsí
comm -23 $WORK_DIR/col1.tmp $WORK_DIR/col3.tmp > $WORK_DIR/sources.txt
uniq $WORK_DIR/sources.txt > $WORK_DIR/sources_uniq.txt
python calc_entity_freqs.py $WORK_DIR/sources.txt | sort -n > $WORK_DIR/sources_freqs.tsv

#Comháireamh na rudaí nach slogaidí ná foinsí iad
comm -12 $WORK_DIR/col1.tmp $WORK_DIR/col3.tmp > $WORK_DIR/repeats.txt
uniq $WORK_DIR/repeats.txt > $WORK_DIR/repeats_uniq.txt
python calc_entity_freqs.py $WORK_DIR/repeats.txt | sort -n > $WORK_DIR/repeats_freqs.tsv

#Faigh sonraí
NUM_TRIPLES=$( wc -l  < $SOURCE_FILE )
NUM_SINKS=$( wc -l < $WORK_DIR/sinks.txt )
NUM_SINKS_UNIQ=$( wc -l < $WORK_DIR/sinks_uniq.txt )
NUM_SOURCES=$( wc -l < $WORK_DIR/sources.txt )
NUM_SOURCES_UNIQ=$( wc -l < $WORK_DIR/sources_uniq.txt )
NUM_REPEATS=$( wc -l < $WORK_DIR/repeats.txt )
NUM_REPEATS_UNIQ=$( wc -l < $WORK_DIR/repeats_uniq.txt )

#Aschuir sonraí
if [[ PRINT_HEADER -eq 1 ]]
then
    echo "num_triples,num_sinks,num_sinks_no_dup,num_sources,num_sources_no_dup,num_repeats,num_repeats_no_dup"
fi
echo $NUM_TRIPLES,$NUM_SINKS,$NUM_SINKS_UNIQ,$NUM_SOURCES,$NUM_SOURCES_UNIQ,$NUM_REPEATS,$NUM_REPEATS_UNIQ

#Scrois seanchomhaid
rm $WORK_DIR/col1.tmp
rm $WORK_DIR/col3.tmp

if [[ SAVE_WORK_FILES -eq 0 ]]
then
    rm $WORK_DIR/sinks.txt
    rm $WORK_DIR/sinks_uniq.txt
    rm $WORK_DIR/sources.txt
    rm $WORK_DIR/sources_uniq.txt
    rm $WORK_DIR/repeats.txt
    rm $WORK_DIR/repeats_uniq.txt
fi

exit 0
