#!/bin/bash

#REF: https://stackoverflow.com/questions/15384818/how-to-get-the-difference-only-additions-between-two-files-in-linux

SOURCE_FILE=$1
OUT_DIR=$2
PRINT_HEADER=$3
SAVE_TRIPLES_FILES=$4

#Comhaid sealadacha
cut $SOURCE_FILE -f1 | sort > $OUT_DIR/col1.tmp
cut $SOURCE_FILE -f3 | sort > $OUT_DIR/col3.tmp

#Comháireamh na slogaidí
comm -13 $OUT_DIR/col1.tmp $OUT_DIR/col3.tmp > $OUT_DIR/sinks.txt
uniq $OUT_DIR/sinks.txt > $OUT_DIR/sinks_uniq.txt
python calc_entity_freqs.py $OUT_DIR/sinks.txt | sort -n > $OUT_DIR/sinks_freqs.tsv

#Comháireamh na bhfoinsí
comm -23 $OUT_DIR/col1.tmp $OUT_DIR/col3.tmp > $OUT_DIR/sources.txt
uniq $OUT_DIR/sources.txt > $OUT_DIR/sources_uniq.txt
python calc_entity_freqs.py $OUT_DIR/sources.txt | sort -n > $OUT_DIR/sources_freqs.tsv

#Comháireamh na rudaí nach slogaidí ná foinsí iad
comm -12 $OUT_DIR/col1.tmp $OUT_DIR/col3.tmp > $OUT_DIR/repeats.txt
uniq $OUT_DIR/repeats.txt > $OUT_DIR/repeats_uniq.txt
python calc_entity_freqs.py $OUT_DIR/repeats.txt | sort -n > $OUT_DIR/repeats_freqs.tsv

#Faigh sonraí
NUM_TRIPLES=$( wc -l  < $SOURCE_FILE )
NUM_SINKS=$( wc -l < $OUT_DIR/sinks.txt )
NUM_SINKS_UNIQ=$( wc -l < $OUT_DIR/sinks_uniq.txt )
NUM_SOURCES=$( wc -l < $OUT_DIR/sources.txt )
NUM_SOURCES_UNIQ=$( wc -l < $OUT_DIR/sources_uniq.txt )
NUM_REPEATS=$( wc -l < $OUT_DIR/repeats.txt )
NUM_REPEATS_UNIQ=$( wc -l < $OUT_DIR/repeats_uniq.txt )

#Aschuir sonraí
if [[ PRINT_HEADER -eq 1 ]]
then
    echo "num_triples,num_sinks,num_sinks_no_dup,num_sources,num_sinks_no_dup,num_repeats,num_repeats_no_dup"
fi
echo $NUM_TRIPLES,$NUM_SINKS,$NUM_SINKS_UNIQ,$NUM_SOURCES,$NUM_SOURCES_UNIQ,$NUM_REPEATS,$NUM_REPEATS_UNIQ

#Scrois seanchomhaid
rm $OUT_DIR/col1.tmp
rm $OUT_DIR/col3.tmp

if [[ SAVE_TRIPLES_FILES -eq 0 ]]
then
    rm $OUT_DIR/sinks.txt
    rm $OUT_DIR/sinks_uniq.txt
    rm $OUT_DIR/sources.txt
    rm $OUT_DIR/sources_uniq.txt
    rm $OUT_DIR/repeats.txt
    rm $OUT_DIR/repeats_uniq.txt
fi

exit 0
