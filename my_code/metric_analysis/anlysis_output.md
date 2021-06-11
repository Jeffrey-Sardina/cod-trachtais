Param order:
- num_sinks
- num_sinks_no_dup
- num_sources
- num_sources_no_dup
- num_repeats
- num_repeats_no_dup

```
python ./analyze_graph_struct_patterns.py metric_analysis/search_0_metrics.csv 0 best_auc 0.5
Lasso
intercept: 0.7598374
num_sinks -0.0
num_sinks_no_dup -0.0
num_sources -0.0
num_sinks_no_dup.1 -0.0
num_repeats 0.0
num_repeats_no_dup 0.0

r2: 0.0
```

```
python ./analyze_graph_struct_patterns.py metric_analysis/search_0_metrics.csv 0 best_r1 1e-3
Lasso
intercept: 0.6032875357783039
num_sinks -0.0
num_sinks_no_dup -0.0
num_sources -0.0
num_sinks_no_dup.1 -0.5252807446972708
num_repeats 0.0
num_repeats_no_dup 0.0

r2: 0.8237112353069076
```
