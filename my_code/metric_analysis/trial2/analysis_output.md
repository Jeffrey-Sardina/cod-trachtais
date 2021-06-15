## Models keeping all data
```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_subsetted_data_keep_all/search_0_metrics.csv 2 best_auc 1 0.5
Lasso
intercept: 0.8773132853015111
- num_triples 0.0
- num_sinks -0.0
- num_sinks_no_dup -2.6147352598210844e-05
- num_sources -0.0
- num_sources_no_dup -1.5843860242271477e-05
- num_repeats 0.0
- num_repeats_no_dup 0.0
- sink_avg 0.0
- sink_min 0.0
- sink_q1 0.0
- sink_med 0.0
- sink_q3 0.0
- sink_max 0.0
- source_avg 0.0
- source_min 0.0
- source_q1 0.0
- source_med 0.0
- source_q3 0.0
- source_max -0.0
- repeat_avg 0.0
- repeat_min 0.0
- repeat_q1 0.0
- repeat_med -0.0
- repeat_q3 0.0
- repeat_max 0.0
- ratio_num_sinks -0.0
- ratio_num_sinks_no_dup -0.0
- ratio_num_sources -0.0
- ratio_num_sources_no_dup -0.0
- ratio_num_repeats 0.0
- ratio_num_repeats_no_dup 0.0
- ratio_sink_avg 0.0
- ratio_sink_min -0.0
- ratio_sink_q1 -0.0
- ratio_sink_med -0.0
- ratio_sink_q3 -0.0
- ratio_sink_max 0.0
- ratio_source_avg 0.0
- ratio_source_min -0.0
- ratio_source_q1 -0.0
- ratio_source_med -0.0
- ratio_source_q3 -0.0
- ratio_source_max -0.0
- ratio_repeat_avg 0.0
- ratio_repeat_min -0.0
- ratio_repeat_q1 -0.0
- ratio_repeat_med -0.0
- ratio_repeat_q3 0.0
- ratio_repeat_max 0.0

r2: 0.46269997165233745
```

```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_subsetted_data_keep_all/search_0_metrics.csv 2 best_r1 1 0.1
Lasso
intercept: 0.13309790742553862
- num_triples 5.198433514872955e-05
- num_sinks 0.0
- num_sinks_no_dup -0.0001065456015384696
- num_sources 0.0
- num_sources_no_dup 0.0
- num_repeats 0.0
- num_repeats_no_dup 0.00024251300352668605
- sink_avg 0.0
- sink_min 0.0
- sink_q1 0.0
- sink_med 0.0
- sink_q3 0.0
- sink_max 0.0
- source_avg 0.0
- source_min 0.0
- source_q1 0.0
- source_med 0.0
- source_q3 0.0
- source_max -0.0
- repeat_avg -0.0
- repeat_min 0.0
- repeat_q1 0.0
- repeat_med 0.0
- repeat_q3 -0.0
- repeat_max -0.0
- ratio_num_sinks -0.0
- ratio_num_sinks_no_dup -0.0
- ratio_num_sources -0.0
- ratio_num_sources_no_dup -0.0
- ratio_num_repeats 0.0
- ratio_num_repeats_no_dup 0.0
- ratio_sink_avg -0.0
- ratio_sink_min -0.0
- ratio_sink_q1 -0.0
- ratio_sink_med -0.0
- ratio_sink_q3 -0.0
- ratio_sink_max 0.0
- ratio_source_avg 0.0
- ratio_source_min -0.0
- ratio_source_q1 -0.0
- ratio_source_med -0.0
- ratio_source_q3 -0.0
- ratio_source_max -0.0
- ratio_repeat_avg -0.0
- ratio_repeat_min -0.0
- ratio_repeat_q1 -0.0
- ratio_repeat_med 0.0
- ratio_repeat_q3 -0.0
- ratio_repeat_max -0.0

r2: 0.9725471721062803
```

I am suspicisou of the generalizability of these--since they all depend on raw counts, running them on datasets of different sizes is almost certainly going to yeild bad results. I'll try again with only ratios.

## Models on ratios only
```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_subsetted_data_ratios_only/search_0_metrics.csv 2 best_r1 0 0.5
Lasso
intercept: 0.12547433333333333
- ratio_num_sinks -0.0
- ratio_num_sinks_no_dup -0.0
- ratio_num_sources -0.0
- ratio_num_sources_no_dup -0.0
- ratio_num_repeats 0.0
- ratio_num_repeats_no_dup 0.0
- ratio_sink_avg 0.0
- ratio_sink_min -0.0
- ratio_sink_q1 -0.0
- ratio_sink_med -0.0
- ratio_sink_q3 -0.0
- ratio_sink_max 0.0
- ratio_source_avg -0.0
- ratio_source_min -0.0
- ratio_source_q1 -0.0
- ratio_source_med -0.0
- ratio_source_q3 -0.0
- ratio_source_max -0.0
- ratio_repeat_avg -0.0
- ratio_repeat_min -0.0
- ratio_repeat_q1 -0.0
- ratio_repeat_med -0.0
- ratio_repeat_q3 -0.0
- ratio_repeat_max 0.0

r2: 0.0
```
Not sure if this is underfitting

```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_subsetted_data_ratios_only/search_0_metrics.csv 2 best_r1 0 1e-3
Lasso
intercept: 0.5647760086091115
- ratio_num_sinks -0.0
- ratio_num_sinks_no_dup -0.0
- ratio_num_sources -0.0
- ratio_num_sources_no_dup -0.4844326194493845
- ratio_num_repeats 0.0
- ratio_num_repeats_no_dup 0.0
- ratio_sink_avg 0.0
- ratio_sink_min -0.0
- ratio_sink_q1 -0.0
- ratio_sink_med -0.0
- ratio_sink_q3 -0.0
- ratio_sink_max 0.0
- ratio_source_avg 0.0
- ratio_source_min -0.0
- ratio_source_q1 -0.0
- ratio_source_med -0.0
- ratio_source_q3 -0.0
- ratio_source_max -0.0
- ratio_repeat_avg -0.0
- ratio_repeat_min -0.0
- ratio_repeat_q1 -0.0
- ratio_repeat_med -0.0
- ratio_repeat_q3 -0.0
- ratio_repeat_max 0.0

r2: 0.8009660103555563
```
Not sure if this is overfitting

## Ratios only: train on subsets, test on full

```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_subsetted_data_ratios_only/search_0_metrics.csv 3 best_r1 0 1e-3 metric_analysis/trial2/cv_full_datasets_ratios_only/full_model_metrics.csv 
Lasso
intercept: 0.5647760086091115
- ratio_num_sinks -0.0
- ratio_num_sinks_no_dup -0.0
- ratio_num_sources -0.0
- ratio_num_sources_no_dup -0.4844326194493845
- ratio_num_repeats 0.0
- ratio_num_repeats_no_dup 0.0
- ratio_sink_avg 0.0
- ratio_sink_min -0.0
- ratio_sink_q1 -0.0
- ratio_sink_med -0.0
- ratio_sink_q3 -0.0
- ratio_sink_max 0.0
- ratio_source_avg 0.0
- ratio_source_min -0.0
- ratio_source_q1 -0.0
- ratio_source_med -0.0
- ratio_source_q3 -0.0
- ratio_source_max -0.0
- ratio_repeat_avg -0.0
- ratio_repeat_min -0.0
- ratio_repeat_q1 -0.0
- ratio_repeat_med -0.0
- ratio_repeat_q3 -0.0
- ratio_repeat_max 0.0

r2: -1490.3167526709076
```

```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_subsetted_data_ratios_only/search_0_metrics.csv 3 best_r1 0 0.5 metric_analysis/trial2/cv_full_datasets_ratios_only/full_model_metrics.csv 
Lasso
intercept: 0.12547433333333333
- ratio_num_sinks -0.0
- ratio_num_sinks_no_dup -0.0
- ratio_num_sources -0.0
- ratio_num_sources_no_dup -0.0
- ratio_num_repeats 0.0
- ratio_num_repeats_no_dup 0.0
- ratio_sink_avg 0.0
- ratio_sink_min -0.0
- ratio_sink_q1 -0.0
- ratio_sink_med -0.0
- ratio_sink_q3 -0.0
- ratio_sink_max 0.0
- ratio_source_avg -0.0
- ratio_source_min -0.0
- ratio_source_q1 -0.0
- ratio_source_med -0.0
- ratio_source_q3 -0.0
- ratio_source_max -0.0
- ratio_repeat_avg -0.0
- ratio_repeat_min -0.0
- ratio_repeat_q1 -0.0
- ratio_repeat_med -0.0
- ratio_repeat_q3 -0.0
- ratio_repeat_max 0.0

r2: -29.463945337460235
```
So it looks like the data just does not fit between subsets and real data, unfortunately