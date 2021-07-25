#!/bin/bash
### full datasets
echo 'bio_full' > metric_analysis/sink_src_repeat/full_dataset_metrics.csv
./calc_graph_stats.sh ../copies/bioportal/all_compressed.tsv /tmp 1 0 >> metric_analysis/sink_src_repeat/full_dataset_metrics.csv

echo 'db_full' >> metric_analysis/sink_src_repeat/full_dataset_metrics.csv
./calc_graph_stats.sh ../copies/dbsnp/all_compressed.tsv /tmp 0 0 >> metric_analysis/sink_src_repeat/full_dataset_metrics.csv

echo 'drug_full' >> metric_analysis/sink_src_repeat/full_dataset_metrics.csv
./calc_graph_stats.sh ../copies/drugbank/all_compressed.tsv /tmp 0 0 >> metric_analysis/sink_src_repeat/full_dataset_metrics.csv

echo 'omim_full' >> metric_analysis/sink_src_repeat/full_dataset_metrics.csv
./calc_graph_stats.sh ../copies/omim/all_compressed.tsv /tmp 0 0 >> metric_analysis/sink_src_repeat/full_dataset_metrics.csv

echo 'ph_full' >> metric_analysis/sink_src_repeat/full_dataset_metrics.csv
./calc_graph_stats.sh ../copies/pharmgkb/all_compressed.tsv /tmp 0 0 >> metric_analysis/sink_src_repeat/full_dataset_metrics.csv

echo 'goa_full' >> metric_analysis/sink_src_repeat/full_dataset_metrics.csv
./calc_graph_stats.sh ../copies/goa/all_compressed.tsv /tmp 0 0 >> metric_analysis/sink_src_repeat/full_dataset_metrics.csv

echo 'hgnc_full' >> metric_analysis/sink_src_repeat/full_dataset_metrics.csv
./calc_graph_stats.sh ../copies/hgnc/all_compressed.tsv /tmp 0 0 >> metric_analysis/sink_src_repeat/full_dataset_metrics.csv

echo 'kegg_full' >> metric_analysis/sink_src_repeat/full_dataset_metrics.csv
./calc_graph_stats.sh ../copies/kegg/all_compressed.tsv /tmp 0 0 >> metric_analysis/sink_src_repeat/full_dataset_metrics.csv

echo 'lsr_full' >> metric_analysis/sink_src_repeat/full_dataset_metrics.csv
./calc_graph_stats.sh ../copies/lsr/all_compressed.tsv /tmp 0 0 >> metric_analysis/sink_src_repeat/full_dataset_metrics.csv


