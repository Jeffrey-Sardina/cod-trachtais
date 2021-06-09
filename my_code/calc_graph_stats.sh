#!/bin/bash

#REF: https://stackoverflow.com/questions/15384818/how-to-get-the-difference-only-additions-between-two-files-in-linux

SOURCE_FILE=$1
OUT_DIR=$2

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
NUM_SOURCS=$( wc -l < $OUT_DIR/sources.txt )
NUM_SOURCS_UNIQ=$( wc -l < $OUT_DIR/sources_uniq.txt )
NUM_REPEATS=$( wc -l < $OUT_DIR/repeats.txt )
NUM_REPEATS_UNIQ=$( wc -l < $OUT_DIR/repeats_uniq.txt )

#Aschuir sonraí
echo "Num triples" $NUM_TRIPLES
echo "Num sinks" $NUM_SINKS
echo "Num sinks, not counting duplicates" $NUM_SINKS_UNIQ
echo "Num sources" $NUM_SOURCS
echo "Num sources, not counting duplicates" $NUM_SOURCS_UNIQ
echo "Num s-o repeats" $NUM_REPEATS
echo "Num s-o repeats, not counting duplicates" $NUM_REPEATS_UNIQ

#Scrois seanchomhaid
rm $OUT_DIR/col1.tmp
rm $OUT_DIR/col3.tmp
