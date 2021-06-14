#!/bin/bash


# ./pbg_pipeline.sh dbsnp validated50e_100d_1 1 3 config/final.py 2
# ./pbg_pipeline.sh drugbank validated50e_100d_1 1 3 config/final.py 2
# ./pbg_pipeline.sh bioportal validated50e_100d_1 1 3 config/final.py 3

# ### iteration 1
# echo 'bio1' > metric_analysis/trial2/search_0_metrics.csv
# ./calc_graph_stats.sh ../iterations_search_0/it_1/rounds/round1_4000_2part/copies/bioportal_randsub_4000/all_compressed.tsv /tmp 1 0 >> metric_analysis/trial2/search_0_metrics.csv

# echo 'db1' >> metric_analysis/trial2/search_0_metrics.csv
# ./calc_graph_stats.sh ../iterations_search_0/it_1/rounds/round1_4000_2part/copies/dbsnp_randsub_4000/all_compressed.tsv /tmp 0 0 >> metric_analysis/trial2/search_0_metrics.csv

# echo 'drug1' >> metric_analysis/trial2/search_0_metrics.csv
# ./calc_graph_stats.sh ../iterations_search_0/it_1/rounds/round1_4000_2part/copies/drugbank_randsub_4000/all_compressed.tsv /tmp 0 0 >> metric_analysis/trial2/search_0_metrics.csv

# echo 'omim1' >> metric_analysis/trial2/search_0_metrics.csv
# ./calc_graph_stats.sh ../iterations_search_0/it_1/rounds/round1_4000_2part/copies/omim_randsub_4000/all_compressed.tsv /tmp 0 0 >> metric_analysis/trial2/search_0_metrics.csv

# echo 'ph1' >> metric_analysis/trial2/search_0_metrics.csv
# ./calc_graph_stats.sh ../iterations_search_0/it_1/rounds/round1_4000_2part/copies/pharmgkb_randsub_4000/all_compressed.tsv /tmp 0 0 >> metric_analysis/trial2/search_0_metrics.csv

# ### iteration 1
# echo 'bio2' >> metric_analysis/trial2/search_0_metrics.csv
# ./calc_graph_stats.sh ../iterations_search_0/it_2/rounds/round1_4000_2part/copies/bioportal_randsub_4000/all_compressed.tsv /tmp 0 0 >> metric_analysis/trial2/search_0_metrics.csv

# echo 'db2' >> metric_analysis/trial2/search_0_metrics.csv
# ./calc_graph_stats.sh ../iterations_search_0/it_2/rounds/round1_4000_2part/copies/dbsnp_randsub_4000/all_compressed.tsv /tmp 0 0 >> metric_analysis/trial2/search_0_metrics.csv

# echo 'drug2' >> metric_analysis/trial2/search_0_metrics.csv
# ./calc_graph_stats.sh ../iterations_search_0/it_2/rounds/round1_4000_2part/copies/drugbank_randsub_4000/all_compressed.tsv /tmp 0 0 >> metric_analysis/trial2/search_0_metrics.csv

# echo 'omim2' >> metric_analysis/trial2/search_0_metrics.csv
# ./calc_graph_stats.sh ../iterations_search_0/it_2/rounds/round1_4000_2part/copies/omim_randsub_4000/all_compressed.tsv /tmp 0 0 >> metric_analysis/trial2/search_0_metrics.csv

# echo 'ph2' >> metric_analysis/trial2/search_0_metrics.csv
# ./calc_graph_stats.sh ../iterations_search_0/it_2/rounds/round1_4000_2part/copies/pharmgkb_randsub_4000/all_compressed.tsv /tmp 0 0 >> metric_analysis/trial2/search_0_metrics.csv

# ### iteration 1
# echo 'bio3' >> metric_analysis/trial2/search_0_metrics.csv
# ./calc_graph_stats.sh ../iterations_search_0/it_3/rounds/round1_4000_2part/copies/bioportal_randsub_4000/all_compressed.tsv /tmp 0 0 >> metric_analysis/trial2/search_0_metrics.csv

# echo 'db3' >> metric_analysis/trial2/search_0_metrics.csv
# ./calc_graph_stats.sh ../iterations_search_0/it_3/rounds/round1_4000_2part/copies/dbsnp_randsub_4000/all_compressed.tsv /tmp 0 0 >> metric_analysis/trial2/search_0_metrics.csv

# echo 'drug3' >> metric_analysis/trial2/search_0_metrics.csv
# ./calc_graph_stats.sh ../iterations_search_0/it_3/rounds/round1_4000_2part/copies/drugbank_randsub_4000/all_compressed.tsv /tmp 0 0 >> metric_analysis/trial2/search_0_metrics.csv

# echo 'omim3' >> metric_analysis/trial2/search_0_metrics.csv
# ./calc_graph_stats.sh ../iterations_search_0/it_3/rounds/round1_4000_2part/copies/omim_randsub_4000/all_compressed.tsv /tmp 0 0 >> metric_analysis/trial2/search_0_metrics.csv

# echo 'ph3' >> metric_analysis/trial2/search_0_metrics.csv
# ./calc_graph_stats.sh ../iterations_search_0/it_3/rounds/round1_4000_2part/copies/pharmgkb_randsub_4000/all_compressed.tsv /tmp 0 0 >> metric_analysis/trial2/search_0_metrics.csv

### full datasets
echo 'db_full' >> metric_analysis/trial2/full_dataset_metrics.csv
./calc_graph_stats.sh ../copies/dbsnp/all_compressed.tsv /tmp 0 0 >> metric_analysis/trial2/full_dataset_metrics.csv

echo 'drug_full' >> metric_analysis/trial2/full_dataset_metrics.csv
./calc_graph_stats.sh ../copies/drugbank/all_compressed.tsv /tmp 0 0 >> metric_analysis/trial2/full_dataset_metrics.csv

echo 'omim_full' >> metric_analysis/trial2/full_dataset_metrics.csv
./calc_graph_stats.sh ../copies/omim/all_compressed.tsv /tmp 0 0 >> metric_analysis/trial2/full_dataset_metrics.csv

echo 'ph_full' >> metric_analysis/trial2/full_dataset_metrics.csv
./calc_graph_stats.sh ../copies/pharmgkb/all_compressed.tsv /tmp 0 0 >> metric_analysis/trial2/full_dataset_metrics.csv


