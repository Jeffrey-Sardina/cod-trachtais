#!/bin/bash

#Remove data from previous demo rounds, if any
if [[ -d ../models/lsr/ ]]
then
    rm ../models/lsr/*
    rmdir ../models/lsr
fi
if [[ -d backup_points/lsr_lsr_demo_bioconf/ ]]
then
    rm backup_points/lsr_lsr_demo_bioconf/*
    rmdir backup_points/lsr_lsr_demo_bioconf
fi
if [[ -d ../copies/lsr/pbg_split/ ]]
then
    rm -r ../copies/lsr/pbg_split/
fi
if [[ -d ../copies/lsr/pbg_out/ ]]
then
    rm -r ../copies/lsr/pbg_out/
fi
if [[ -d ../demo/ ]]
then
    rm -r ../demo/
    mkdir ../demo/
fi

echo '===========Starting Training==========='
echo 'Embedding LSR under the BioPortal configuration'
export TORCH_USE_RTLD_GLOBAL=1
./pbg_pipeline.sh lsr \
    lsr_demo_bioconf \
    0 \
    2 \
    config/final_1_bioportal_rank.py \
    1
mv ../models/lsr ../demo/train_eval
echo '===========Training completed==========='

echo '===========Starting Structural Analysis==========='
echo 'Calculating centrality distribution statistics'
python calc_centrality.py ../copies/lsr/all_compressed.tsv  \
    ../demo/
python calc_entity_centrality_stats.py  \
    ../demo/totaldeg_out.tsv 1 > ../demo/centrality_stats.csv
rm ../demo/indeg.tsv
rm ../demo/outdeg_out.tsv
rm ../demo/totaldeg_out.tsv

echo 'Calculating sink, source, and repeat statistics'
./calc_graph_stats.sh ../copies/lsr/all_compressed.tsv  \
    /tmp  \
    1  \
    0 > ../demo/ssr_out.csv
cat ../demo/ssr_out.csv \
    | cut -d',' -f3,5,7 > ../demo/ssr_stats.csv
rm ../demo/ssr_out.csv

echo 'Calculating dataset size'
cat ../copies/lsr/all_compressed.tsv \
    | wc -l > ../demo/size.txt 

echo '===========Structural Analysis completed==========='
