#!/bin/bash


# ./pbg_pipeline.sh dbsnp validated50e_100d_1 1 3 config/final.py 2
# ./pbg_pipeline.sh drugbank validated50e_100d_1 1 3 config/final.py 2
# ./pbg_pipeline.sh bioportal validated50e_100d_1 1 3 config/final.py 3

echo 'bio' >> metric_analysis/search_0_metrics.csv
./calc_graph_stats.sh ../iterations_search_0/it_3/rounds/round1_4000_2part/copies/bioportal_randsub_4000/all_compressed.tsv /tmp 0 0 >> metric_analysis/search_0_metrics.csv
echo 'db' >> metric_analysis/search_0_metrics.csv
./calc_graph_stats.sh ../iterations_search_0/it_3/rounds/round1_4000_2part/copies/dbsnp_randsub_4000/all_compressed.tsv /tmp 0 0 >> metric_analysis/search_0_metrics.csv
echo 'drug' >> metric_analysis/search_0_metrics.csv
./calc_graph_stats.sh ../iterations_search_0/it_3/rounds/round1_4000_2part/copies/drugbank_randsub_4000/all_compressed.tsv /tmp 0 0 >> metric_analysis/search_0_metrics.csv
echo 'omim' >> metric_analysis/search_0_metrics.csv
./calc_graph_stats.sh ../iterations_search_0/it_3/rounds/round1_4000_2part/copies/omim_randsub_4000/all_compressed.tsv /tmp 0 0 >> metric_analysis/search_0_metrics.csv
echo 'ph' >> metric_analysis/search_0_metrics.csv
./calc_graph_stats.sh ../iterations_search_0/it_3/rounds/round1_4000_2part/copies/pharmgkb_randsub_4000/all_compressed.tsv /tmp 0 0 >> metric_analysis/search_0_metrics.csv