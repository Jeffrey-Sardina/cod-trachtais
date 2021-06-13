#!/bin/bash

#REF: https://stackoverflow.com/questions/15384818/how-to-get-the-difference-only-additions-between-two-files-in-linux

SOURCE_FILE=$1 #an all.tsv or all_compressed.tsv
WORK_DIR=$2
PRINT_HEADER=$3
SAVE_WORK_FILES=$4

#Comhaid sealadacha
cut $SOURCE_FILE -f1 | sort > $WORK_DIR/col1.tmp
cut $SOURCE_FILE -f3 | sort > $WORK_DIR/col3.tmp

#Comhaireamh na slogaidí
comm -13 $WORK_DIR/col1.tmp $WORK_DIR/col3.tmp > $WORK_DIR/sinks.txt
uniq $WORK_DIR/sinks.txt > $WORK_DIR/sinks_uniq.txt
python calc_entity_freqs.py $WORK_DIR/sinks.txt | sort -n > $WORK_DIR/sinks_freqs.tsv
SOURCE_STATS=$( python calc_entity_degree_stats.py $WORK_DIR/sinks_freqs.tsv )

#Comhaireamh na bhfoinsí
comm -23 $WORK_DIR/col1.tmp $WORK_DIR/col3.tmp > $WORK_DIR/sources.txt
uniq $WORK_DIR/sources.txt > $WORK_DIR/sources_uniq.txt
python calc_entity_freqs.py $WORK_DIR/sources.txt | sort -n > $WORK_DIR/sources_freqs.tsv
SINK_STATS=$( python calc_entity_degree_stats.py $WORK_DIR/sinks_freqs.tsv )

#Comhaireamh na rudaí nach slogaidí ná foinsí iad
comm -12 $WORK_DIR/col1.tmp $WORK_DIR/col3.tmp > $WORK_DIR/repeats.txt
uniq $WORK_DIR/repeats.txt > $WORK_DIR/repeats_uniq.txt
python calc_entity_freqs.py $WORK_DIR/repeats.txt | sort -n > $WORK_DIR/repeats_freqs.tsv
REPEAT_STATS=$( python calc_entity_degree_stats.py $WORK_DIR/sinks_freqs.tsv )

#Faigh sonraí gnáthacha
NUM_TRIPLES=$( wc -l  < $SOURCE_FILE )
NUM_SINKS=$( wc -l < $WORK_DIR/sinks.txt )
NUM_SINKS_UNIQ=$( wc -l < $WORK_DIR/sinks_uniq.txt )
NUM_SOURCES=$( wc -l < $WORK_DIR/sources.txt )
NUM_SOURCES_UNIQ=$( wc -l < $WORK_DIR/sources_uniq.txt )
NUM_REPEATS=$( wc -l < $WORK_DIR/repeats.txt )
NUM_REPEATS_UNIQ=$( wc -l < $WORK_DIR/repeats_uniq.txt )

#Faigh sonraí ar na slogaidí
SINK_AVG_COUNT=$( cut -f1 <<< $SINK_STATS )
SINK_MIN_COUNT=$( cut -f2 <<< $SINK_STATS )
SINK_Q1_COUNT=$( cut -f3 <<< $SINK_STATS )
SINK_MED_COUNT=$( cut -f4 <<< $SINK_STATS )
SINK_Q3_COUNT=$( cut -f5 <<< $SINK_STATS )
SINK_MAX_COUNT=$( cut -f6 <<< $SINK_STATS )

#Faigh sonraí ar na foinsí
SOURCE_AVG_COUNT=$( cut -f1 <<< $SOURCE_STATS )
SOURCE_MIN_COUNT=$( cut -f2 <<< $SOURCE_STATS )
SOURCE_Q1_COUNT=$( cut -f3 <<< $SOURCE_STATS )
SOURCE_MED_COUNT=$( cut -f4 <<< $SOURCE_STATS )
SOURCE_Q3_COUNT=$( cut -f5 <<< $SOURCE_STATS )
SOURCE_MAX_COUNT=$( cut -f6 <<< $SOURCE_STATS )

#Faigh sonraí ar na foinsí
REPEAT_AVG_COUNT=$( cut -f1 <<< $REPEAT_STATS )
REPEAT_MIN_COUNT=$( cut -f2 <<< $REPEAT_STATS )
REPEAT_Q1_COUNT=$( cut -f3 <<< $REPEAT_STATS )
REPEAT_MED_COUNT=$( cut -f4 <<< $REPEAT_STATS )
REPEAT_Q3_COUNT=$( cut -f5 <<< $REPEAT_STATS )
REPEAT_MAX_COUNT=$( cut -f6 <<< $REPEAT_STATS )

#Aschuir sonraí
if [[ PRINT_HEADER -eq 1 ]]
then
    echo -n "num_triples,num_sinks,num_sinks_no_dup,num_sources,num_sources_no_dup,num_repeats,num_repeats_no_dup,"
    echo -n "sink_avg,sink_min,sink_q1,sink_med,sink_q3,sink_max,"
    echo -n "source_avg,source_min,source_q1,source_med,source_q3,source_max,"
    echo "repeat_avg,repeat_min,repeat_q1,repeat_med,repeat_q3,repeat_max"
fi
echo -n $NUM_TRIPLES,$NUM_SINKS,$NUM_SINKS_UNIQ,$NUM_SOURCES,$NUM_SOURCES_UNIQ,$NUM_REPEATS,$NUM_REPEATS_UNIQ,
echo -n $SINK_AVG_COUNT,$SINK_MIN_COUNT,$SINK_Q1_COUNT,$SINK_MED_COUNT,$SINK_Q3_COUNT,$SINK_MAX_COUNT,
echo -n $SOURCE_AVG_COUNT,$SOURCE_MIN_COUNT,$SOURCE_Q1_COUNT,$SOURCE_MED_COUNT,$SOURCE_Q3_COUNT,$SOURCE_MAX_COUNT,
echo $REPEAT_AVG_COUNT,$REPEAT_MIN_COUNT,$REPEAT_Q1_COUNT,$REPEAT_MED_COUNT,$REPEAT_Q3_COUNT,$REPEAT_MAX_COUNT

#Scrois seanchomhaid
rm $WORK_DIR/col1.tmp
rm $WORK_DIR/col3.tmp

if [[ SAVE_WORK_FILES -eq 0 ]]
then
    rm $WORK_DIR/sinks.txt
    rm $WORK_DIR/sinks_uniq.txt
    rm $WORK_DIR/sinks_freqs.tsv
    rm $WORK_DIR/sources.txt
    rm $WORK_DIR/sources_uniq.txt
    rm $WORK_DIR/sources_freqs.tsv
    rm $WORK_DIR/repeats.txt
    rm $WORK_DIR/repeats_uniq.txt
    rm $WORK_DIR/repeats_freqs.tsv
fi

exit 0
