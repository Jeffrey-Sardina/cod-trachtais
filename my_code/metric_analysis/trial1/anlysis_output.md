Param order:
- num_sinks
- num_sinks_no_dup
- num_sources
- num_sources_no_dup
- num_repeats
- num_repeats_no_dup

Note: "num" here should be "fraction" (to total number of triples used in the training batch)

Stats for the Lasso regression on r1 (train + eval on subsetted data)
```
python ./analyze_graph_struct_patterns.py metric_analysis/search_0_metrics.csv 0 best_r1 1e-3
Lasso
intercept: 0.5647760086091115
- num_sinks -0.0
- num_sinks_no_dup -0.0
- num_sources -0.0
- num_sources_no_dup -0.4844326194493845
- num_repeats 0.0
- num_repeats_no_dup 0.0

r2: 0.8009660103555563
```

Stats for the Lasso regression on auc (train + eval on subsetted data)
```
python ./analyze_graph_struct_patterns.py metric_analysis/search_0_metrics.csv 0 best_auc 0.5
Lasso
intercept: 0.7581981999999999
- num_sinks -0.0
- num_sinks_no_dup -0.0
- num_sources -0.0
- num_sources_no_dup -0.0
- num_repeats 0.0
- num_repeats_no_dup 0.0

r2: 0.0
```

Stats for the Lasso regression, trained on subsetted data and evaluated on auc with full-dataset data (bioportal full dataset not in)
```
python ./analyze_graph_struct_patterns.py metric_analysis/search_0_metrics.csv 3 best_r1 1e-3 metric_analysis/full_model_metrics.csv 
Lasso
intercept: 0.5647760086091115
- num_sinks -0.0
- num_sinks_no_dup -0.0
- num_sources -0.0
- num_sources_no_dup -0.4844326194493845
- num_repeats 0.0
- num_repeats_no_dup 0.0

r2: -0.530782131309941
```

Stats for the Lasso regression, trained on subsetted data and evaluated on r1 with full-dataset data (bioportal full dataset not in)
```
python ./analyze_graph_struct_patterns.py metric_analysis/search_0_metrics.csv 3 best_r1 1e-3 metric_analysis/full_model_metrics.csv 
Lasso
intercept: 0.5647760086091115
- num_sinks -0.0
- num_sinks_no_dup -0.0
- num_sources -0.0
- num_sources_no_dup -0.4844326194493845
- num_repeats 0.0
- num_repeats_no_dup 0.0

r2: -0.530782131309941
```

Stats for the Lasso regression, trained on full data and evaluated on auc with full-dataset data (bioportal full dataset not in)
```
python ./analyze_graph_struct_patterns.py metric_analysis/full_model_metrics.csv 2 best_auc 0.5
Lasso
intercept: 0.6146577
- num_sinks -0.0
- num_sinks_no_dup 0.0
- num_sources -0.0
- num_sources_no_dup 0.0
- num_repeats 0.0
- num_repeats_no_dup 0.0

r2: 0.0
```

Stats for the Lasso regression, trained on full data and evaluated on r1 with full-dataset data (bioportal full dataset not in)
```
python ./analyze_graph_struct_patterns.py metric_analysis/full_model_metrics.csv 2 best_r1 1e-2
Lasso
intercept: 1.0440302153518886
- num_sinks 0.0
- num_sinks_no_dup -2.2709606398513813
- num_sources 0.0
- num_sources_no_dup -0.0
- num_repeats -0.0
- num_repeats_no_dup -0.0

r2: 0.6000088950774753
```

Stats for the Lasso regression, trained on all data (subsetted and full-dataset)and evaluated on auc with all data (bioportal full dataset not in)
```
python ./analyze_graph_struct_patterns.py metric_analysis/all_metrics.csv 2 best_auc 0.5Lasso
intercept: 0.7279791473684211
- num_sinks -0.0
- num_sinks_no_dup 0.0
- num_sources -0.0
- num_sources_no_dup 0.0
- num_repeats 0.0
- num_repeats_no_dup 0.0

r2: 0.0
```

Stats for the Lasso regression, trained on all data (subsetted and full-dataset)and evaluated on r1 with all data (bioportal full dataset not in)
```
python ./analyze_graph_struct_patterns.py metric_analysis/all_metrics.csv 2 best_r1 0.5
Lasso
intercept: 0.15387736315789474
- num_sinks -0.0
- num_sinks_no_dup -0.0
- num_sources -0.0
- num_sources_no_dup -0.0
- num_repeats 0.0
- num_repeats_no_dup 0.0

r2: 0.0
```
