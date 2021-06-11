Param order:
- num_sinks
- num_sinks_no_dup
- num_sources
- num_sources_no_dup
- num_repeats
- num_repeats_no_dup

Note: "num" here should be "fraction" (to total number of triples used in the training batch)

Stats for the Lasso regression on r1
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

Stats for the Lasso regression on auc
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
