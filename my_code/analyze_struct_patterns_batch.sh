#!/bin/bash

# 6.4.1 Round 1
# #Cross vals
# echo 'cent_r1_bioconf'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/centrality_stats_bioconf.csv \
#     1 \
#     r1 \
#     cent_r1_bioconf

# echo 'cent_auc_bioconf'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/centrality_stats_bioconf.csv \
#     1 \
#     AUC \
#     cent_auc_bioconf

# echo 'cent_r1_general'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/centrality_stats_general.csv \
#     1 \
#     r1 \
#     cent_r1_general

# echo 'cent_auc_general'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/centrality_stats_general.csv \
#     1 \
#     AUC \
#     cent_auc_general

# echo 'sink_r1_bioconf'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/sinks_stats_bioconf.csv \
#     1 \
#     r1 \
#     sink_r1_bioconf

# echo 'sink_auc_bioconf'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/sinks_stats_bioconf.csv \
#     1 \
#     AUC \
#     sink_auc_bioconf

# echo 'sink_r1_general'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/sinks_stats_general.csv \
#     1 \
#     r1 \
#     sink_r1_general

# echo 'sink_auc_general'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/sinks_stats_general.csv \
#     1 \
#     AUC \
#     sink_auc_general


# # Evals
# echo 'cent_r1_bioconf'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/centrality_stats_bioconf.csv \
#     2 \
#     r1 \
#     cent_r1_bioconf \
#     1e-2

# echo 'cent_auc_bioconf'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/centrality_stats_bioconf.csv \
#     2 \
#     AUC \
#     cent_auc_bioconf \
#     1e-2
#     #1

# echo 'cent_r1_general'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/centrality_stats_general.csv \
#     2 \
#     r1 \
#     cent_r1_general \
#     1e-2

# echo 'cent_auc_general'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/centrality_stats_general.csv \
#     2 \
#     AUC \
#     cent_auc_general \
#     1e-2

# echo 'sink_r1_bioconf'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/sinks_stats_bioconf.csv \
#     2 \
#     r1 \
#     sink_r1_bioconf \
#     1e-3

# echo 'sink_auc_bioconf'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/sinks_stats_bioconf.csv \
#     2 \
#     AUC \
#     sink_auc_bioconf \
#     1e-3
#     #1

# echo 'sink_r1_general'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/sinks_stats_general.csv \
#     2 \
#     r1 \
#     sink_r1_general \
#     1e-3
#     #1

# echo 'sink_auc_general'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/sinks_stats_general.csv \
#     2 \
#     AUC \
#     sink_auc_general \
#     1e-3



#6.4.1 Round 2
#Cross vals
# echo 'combined_r1_bioconf'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/rounds_2_sinks_cent_separate/bioconf_to_r1_selected.csv \
#     1 \
#     r1 \
#     combined_r1_bioconf

# echo 'combined_auc_bioconf'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/rounds_2_sinks_cent_separate/bioconf_to_auc_selected.csv \
#     1 \
#     AUC \
#     combined_auc_bioconf

# echo 'combined_r1_general'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/rounds_2_sinks_cent_separate/general_to_r1_selected.csv \
#     1 \
#     r1 \
#     combined_r1_general

# echo 'combined_auc_general'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/rounds_2_sinks_cent_separate/general_to_auc_selected.csv \
#     1 \
#     AUC \
#     combined_auc_general

#Evals
#Cross vals
# echo 'combined_r1_bioconf'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/rounds_2_sinks_cent_separate/bioconf_to_r1_selected.csv \
#     2 \
#     r1 \
#     combined_r1_bioconf \
#     1e-2

# echo 'combined_auc_bioconf'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/rounds_2_sinks_cent_separate/bioconf_to_auc_selected.csv \
#     2 \
#     AUC \
#     combined_auc_bioconf \
#     1e-3

# echo 'combined_r1_general'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/rounds_2_sinks_cent_separate/general_to_r1_selected.csv \
#     2 \
#     r1 \
#     combined_r1_general \
#     1e-3

# echo 'combined_auc_general'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/rounds_2_sinks_cent_separate/general_to_auc_selected.csv \
#     2 \
#     AUC \
#     combined_auc_general \
#     1e-3



# #6.4.2 Round 1
# #Cross vals
# echo 'cent_r1_diff'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/round_1_to_difference/centrality_stats.csv \
#     1 \
#     r1 \
#     cent_r1_diff

# echo 'cent_auc_diff'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/round_1_to_difference/centrality_stats.csv \
#     1 \
#     AUC \
#     cent_auc_diff

# echo 'sink_r1_diff'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/round_1_to_difference/sinks_stats.csv \
#     1 \
#     r1 \
#     sink_r1_diff

# echo 'sink_auc_diff'
# python analyze_graph_struct_patterns_new.py \
#     metric_analysis/struct_to_r1_or_auc/round_1_to_difference/sinks_stats.csv \
#     1 \
#     AUC \
#     sink_auc_diff

# Evals
echo 'cent_r1_diff'
python analyze_graph_struct_patterns_new.py \
    metric_analysis/struct_to_r1_or_auc/round_1_to_difference/centrality_stats.csv \
    2 \
    r1 \
    cent_r1_diff \
    1e-1

echo 'cent_auc_diff'
python analyze_graph_struct_patterns_new.py \
    metric_analysis/struct_to_r1_or_auc/round_1_to_difference/centrality_stats.csv \
    2 \
    AUC \
    cent_auc_diff \
    0.5

echo 'sink_r1_diff'
python analyze_graph_struct_patterns_new.py \
    metric_analysis/struct_to_r1_or_auc/round_1_to_difference/sinks_stats.csv \
    2 \
    r1 \
    sink_r1_diff \
    1e-1

echo 'sink_auc_diff'
python analyze_graph_struct_patterns_new.py \
    metric_analysis/struct_to_r1_or_auc/round_1_to_difference/sinks_stats.csv \
    2 \
    AUC \
    sink_auc_diff \
    0.5
