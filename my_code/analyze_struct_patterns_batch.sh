#!/bin/bash

#Cross vals
#TODO: change folds to 5 in analyze_graph_struct_patterns_new
# echo 'cent_r1_bioconf'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1/centrality_stats_bioconf.csv \
#     1 \
#     r1 \
#     cent_r1_bioconf

# echo 'cent_auc_bioconf'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1/centrality_stats_bioconf.csv \
#     1 \
#     AUC \
#     cent_auc_bioconf

# echo 'cent_r1_general'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1/centrality_stats_general.csv \
#     1 \
#     r1 \
#     cent_r1_general

# echo 'cent_auc_general'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1/centrality_stats_general.csv \
#     1 \
#     AUC \
#     cent_auc_general

# echo 'sink_r1_bioconf'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1/sinks_stats_bioconf.csv \
#     1 \
#     r1 \
#     sink_r1_bioconf

# echo 'sink_auc_bioconf'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1/sinks_stats_bioconf.csv \
#     1 \
#     AUC \
#     sink_auc_bioconf

# echo 'sink_r1_general'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1/sinks_stats_general.csv \
#     1 \
#     r1 \
#     sink_r1_general

# echo 'sink_auc_general'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1/sinks_stats_general.csv \
#     1 \
#     AUC \
#     sink_auc_general


# Evals
echo 'cent_r1_bioconf'
python analyze_graph_struct_patterns_new.py \
    metric_analysis/struct_to_r1/centrality_stats_bioconf.csv \
    2 \
    r1 \
    cent_r1_bioconf \
    1e-2

echo 'cent_auc_bioconf'
python analyze_graph_struct_patterns_new.py \
    metric_analysis/struct_to_r1/centrality_stats_bioconf.csv \
    2 \
    AUC \
    cent_auc_bioconf \
    1e-2

echo 'cent_r1_general'
python analyze_graph_struct_patterns_new.py \
    metric_analysis/struct_to_r1/centrality_stats_general.csv \
    2 \
    r1 \
    cent_r1_general \
    1e-1

echo 'cent_auc_general'
python analyze_graph_struct_patterns_new.py \
    metric_analysis/struct_to_r1/centrality_stats_general.csv \
    2 \
    AUC \
    cent_auc_general \
    1e-1

echo 'sink_r1_bioconf'
python analyze_graph_struct_patterns_new.py \
    metric_analysis/struct_to_r1/sinks_stats_bioconf.csv \
    2 \
    r1 \
    sink_r1_bioconf \
    1e-3

echo 'sink_auc_bioconf'
python analyze_graph_struct_patterns_new.py \
    metric_analysis/struct_to_r1/sinks_stats_bioconf.csv \
    2 \
    AUC \
    sink_auc_bioconf \
    1e-3

echo 'sink_r1_general'
python analyze_graph_struct_patterns_new.py \
    metric_analysis/struct_to_r1/sinks_stats_general.csv \
    2 \
    r1 \
    sink_r1_general \
    0.5

echo 'sink_auc_general'
python analyze_graph_struct_patterns_new.py \
    metric_analysis/struct_to_r1/sinks_stats_general.csv \
    2 \
    AUC \
    sink_auc_general \
    0.5
