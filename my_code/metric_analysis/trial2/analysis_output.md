# notes
Since the model is only using num_x, never rations...I am almost certain it is just memorizing datasets by size and overfitting. Nothing here seems generalizable.

# cv_all_metrics:
## AUC, Alpha = 1
```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_all_metrics/all_metrics.csv 2 best_auc 1
/home/siothrun/.local/lib/python3.8/site-packages/sklearn/linear_model/_coordinate_descent.py:530: ConvergenceWarning: Objective did not converge. You might want to increase the number of iterations. Duality gap: 0.0015688077313477768, tolerance: 4.7268646498102735e-05
  model = cd_fast.enet_coordinate_descent(
Lasso
intercept: 0.7603998166216563
- num_triples -1.7328905989573636e-08
- num_sinks -1.3142074902256785e-08
- num_sinks_no_dup 3.8690131357600686e-07
- num_sources -1.4204848623042088e-07
- num_sources_no_dup -6.954779316333038e-07
- num_repeats 6.070709291830054e-07
- num_repeats_no_dup -3.3344610548588204e-07
- sink_avg 0.0
- sink_min 0.0
- sink_q1 0.0
- sink_med -0.0
- sink_q3 -0.0
- sink_max -0.0
- source_avg 0.0
- source_min 0.0
- source_q1 0.0
- source_med 0.0
- source_q3 0.0
- source_max 0.0
- repeat_avg -0.0
- repeat_min 0.0
- repeat_q1 0.0
- repeat_med -0.0
- repeat_q3 -0.0
- repeat_max -0.0
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
- ratio_repeat_avg -0.0
- ratio_repeat_min -0.0
- ratio_repeat_q1 -0.0
- ratio_repeat_med -0.0
- ratio_repeat_q3 -0.0
- ratio_repeat_max 0.0

r2: 0.9916425694143087
```

## AUC, Alpha = 0.5
```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_all_metrics/all_metrics.csv 2 best_auc 0.5
/home/siothrun/.local/lib/python3.8/site-packages/sklearn/linear_model/_coordinate_descent.py:530: ConvergenceWarning: Objective did not converge. You might want to increase the number of iterations. Duality gap: 0.0016541967914210582, tolerance: 4.7268646498102735e-05
  model = cd_fast.enet_coordinate_descent(
Lasso
intercept: 0.7617289853179949
- num_triples -4.0124594868925917e-08
- num_sinks -6.666246774217149e-09
- num_sinks_no_dup 3.6417390783180636e-07
- num_sources -1.3370425614224951e-07
- num_sources_no_dup -1.0810661208651565e-06
- num_repeats 6.961221012598911e-07
- num_repeats_no_dup -4.446270438750157e-07
- sink_avg 0.0
- sink_min 0.0
- sink_q1 0.0
- sink_med -0.0
- sink_q3 -0.0
- sink_max -0.0
- source_avg 0.0
- source_min 0.0
- source_q1 0.0
- source_med 0.0
- source_q3 0.0
- source_max 5.230843347400393e-07
- repeat_avg -0.0
- repeat_min 0.0
- repeat_q1 0.0
- repeat_med -0.0
- repeat_q3 -0.0
- repeat_max -0.0
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
- ratio_repeat_avg -0.0
- ratio_repeat_min -0.0
- ratio_repeat_q1 -0.0
- ratio_repeat_med -0.0
- ratio_repeat_q3 -0.0
- ratio_repeat_max 0.0

r2: 0.9916960007215408
```

## r1, Alpha = 1
```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_all_metrics/all_metrics.csv 2 best_r1 1
/home/siothrun/.local/lib/python3.8/site-packages/sklearn/linear_model/_coordinate_descent.py:530: ConvergenceWarning: Objective did not converge. You might want to increase the number of iterations. Duality gap: 0.024021485738730277, tolerance: 6.0983443191896426e-05
  model = cd_fast.enet_coordinate_descent(
Lasso
intercept: 0.1682502657006681
- num_triples -7.206917795184691e-09
- num_sinks 5.2895530092501327e-08
- num_sinks_no_dup 4.969278250340417e-07
- num_sources -1.7125504233800807e-07
- num_sources_no_dup -1.2091274036775448e-05
- num_repeats 3.60980084257483e-06
- num_repeats_no_dup 4.973596238509752e-06
- sink_avg 0.0
- sink_min 0.0
- sink_q1 0.0
- sink_med -0.0
- sink_q3 -0.0
- sink_max -8.57932887289697e-05
- source_avg -0.0
- source_min 0.0
- source_q1 0.0
- source_med 0.0
- source_q3 0.0
- source_max 1.846913219913445e-06
- repeat_avg -0.0
- repeat_min 0.0
- repeat_q1 0.0
- repeat_med -0.0
- repeat_q3 -0.0
- repeat_max -0.0
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

r2: 0.9152459639866979
```

## r1, Alpha = 0.5
```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_all_metrics/all_metrics.csv 2 best_r1 0.5
/home/siothrun/.local/lib/python3.8/site-packages/sklearn/linear_model/_coordinate_descent.py:530: ConvergenceWarning: Objective did not converge. You might want to increase the number of iterations. Duality gap: 0.025319271922215274, tolerance: 6.0983443191896426e-05
  model = cd_fast.enet_coordinate_descent(
Lasso
intercept: 0.1719414951058525
- num_triples -8.079590121060942e-08
- num_sinks 6.698714501227234e-09
- num_sinks_no_dup 3.432945015719067e-07
- num_sources -1.2096398863583905e-07
- num_sources_no_dup -1.2586238539668586e-05
- num_repeats 6.413554277127271e-06
- num_repeats_no_dup 8.050051909591874e-06
- sink_avg 0.0
- sink_min 0.0
- sink_q1 -0.0
- sink_med -0.0
- sink_q3 -0.0
- sink_max -0.0001435769145129547
- source_avg -0.0
- source_min 0.0
- source_q1 0.0
- source_med 0.0
- source_q3 0.0
- source_max -2.4915754636558996e-06
- repeat_avg -0.0
- repeat_min 0.0
- repeat_q1 0.0
- repeat_med -0.0
- repeat_q3 -0.0
- repeat_max -0.0
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

r2: 0.9177830728717407
```

# cv_subsetted_data
## AUC, alpha = 0.5
```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_subsetted_data/search_0_metrics.csv 2 best_auc 0.5
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

## r1, alpha = 0.1
```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_subsetted_data/search_0_metrics.csv 2 best_r1 0.1
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

## r1, alpha = 0.5
```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_subsetted_data/search_0_metrics.csv 2 best_r1 0.5
Lasso
intercept: 0.3173813345551295
- num_triples 0.0
- num_sinks -0.0
- num_sinks_no_dup -9.74687591377192e-05
- num_sources -0.0
- num_sources_no_dup -0.0
- num_repeats 8.459993128694469e-05
- num_repeats_no_dup 0.0001317700004415775
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
- repeat_max 0.0
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
- ratio_repeat_max 0.0

r2: 0.9610899497625316
```



# cv_full_data
## AUC, alpha=0.1
```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_full_datasets/full_model_metrics.csv 2 best_auc 0.1
Lasso
intercept: 1.061552174001696
- num_triples -1.0155426777872866e-07
- num_sinks -6.606952800793232e-09
- num_sinks_no_dup 1.7806994770720737e-07
- num_sources -3.122491453467016e-08
- num_sources_no_dup 1.4181725792123995e-07
- num_repeats 5.109010513475293e-08
- num_repeats_no_dup -2.0649307922929413e-08
- sink_avg 0.0
- sink_min 0.0
- sink_q1 0.0
- sink_med 0.0
- sink_q3 0.0
- sink_max 6.256428244807752e-06
- source_avg 0.0
- source_min 0.0
- source_q1 0.0
- source_med 0.0
- source_q3 0.0
- source_max -6.9369400451111966e-09
- repeat_avg 0.0
- repeat_min 0.0
- repeat_q1 0.0
- repeat_med 0.0
- repeat_q3 0.0
- repeat_max 2.951695521712168e-07
- ratio_num_sinks -0.0
- ratio_num_sinks_no_dup -0.0
- ratio_num_sources -0.0
- ratio_num_sources_no_dup -0.0
- ratio_num_repeats 0.0
- ratio_num_repeats_no_dup -0.0
- ratio_sink_avg 0.0
- ratio_sink_min -0.0
- ratio_sink_q1 0.0
- ratio_sink_med 0.0
- ratio_sink_q3 0.0
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
- ratio_repeat_q3 -0.0
- ratio_repeat_max 0.0

r2: 0.9999999970706954
```

## AUC, alpha = 1
```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_full_datasets/full_model_metrics.csv 2 best_auc 1
Lasso
intercept: 0.8675663502985584
- num_triples -1.0904517858236808e-07
- num_sinks -1.3092695486488852e-08
- num_sinks_no_dup 1.8886157772509365e-07
- num_sources -3.311724802124113e-08
- num_sources_no_dup 1.0513004468495995e-07
- num_repeats 6.443992601108968e-07
- num_repeats_no_dup -2.0682283467565892e-07
- sink_avg 0.0
- sink_min 0.0
- sink_q1 -0.0
- sink_med 0.0
- sink_q3 0.0
- sink_max 0.0
- source_avg 0.0
- source_min 0.0
- source_q1 0.0
- source_med 0.0
- source_q3 0.0
- source_max -2.6847530298175495e-07
- repeat_avg 0.0
- repeat_min 0.0
- repeat_q1 0.0
- repeat_med 0.0
- repeat_q3 0.0
- repeat_max 0.0
- ratio_num_sinks -0.0
- ratio_num_sinks_no_dup -0.0
- ratio_num_sources -0.0
- ratio_num_sources_no_dup -0.0
- ratio_num_repeats 0.0
- ratio_num_repeats_no_dup 0.0
- ratio_sink_avg 0.0
- ratio_sink_min 0.0
- ratio_sink_q1 0.0
- ratio_sink_med 0.0
- ratio_sink_q3 0.0
- ratio_sink_max 0.0
- ratio_source_avg 0.0
- ratio_source_min 0.0
- ratio_source_q1 0.0
- ratio_source_med 0.0
- ratio_source_q3 0.0
- ratio_source_max -0.0
- ratio_repeat_avg 0.0
- ratio_repeat_min 0.0
- ratio_repeat_q1 0.0
- ratio_repeat_med 0.0
- ratio_repeat_q3 0.0
- ratio_repeat_max 0.0

r2: 0.9999999826346379
```




## r1, alpha = 0.5
```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_full_datasets/full_model_metrics.csv 2 best_r1 0.5
Lasso
intercept: -0.08815959490239356
- num_triples 1.1549120461622192e-07
- num_sinks 1.2457664359369636e-08
- num_sinks_no_dup -2.2741357400554769e-07
- num_sources 3.987741617144146e-08
- num_sources_no_dup -1.4956292186402396e-07
- num_repeats -4.539057668801153e-07
- num_repeats_no_dup 1.4326568121421676e-07
- sink_avg -0.0
- sink_min 0.0
- sink_q1 0.0
- sink_med -0.0
- sink_q3 -0.0
- sink_max -0.0
- source_avg -0.0
- source_min 0.0
- source_q1 0.0
- source_med 0.0
- source_q3 0.0
- source_max 1.9373578541224445e-07
- repeat_avg -0.0
- repeat_min 0.0
- repeat_q1 0.0
- repeat_med 0.0
- repeat_q3 0.0
- repeat_max -0.0
- ratio_num_sinks 0.0
- ratio_num_sinks_no_dup 0.0
- ratio_num_sources 0.0
- ratio_num_sources_no_dup 0.0
- ratio_num_repeats -0.0
- ratio_num_repeats_no_dup -0.0
- ratio_sink_avg -0.0
- ratio_sink_min -0.0
- ratio_sink_q1 -0.0
- ratio_sink_med -0.0
- ratio_sink_q3 -0.0
- ratio_sink_max -0.0
- ratio_source_avg -0.0
- ratio_source_min -0.0
- ratio_source_q1 -0.0
- ratio_source_med -0.0
- ratio_source_q3 -0.0
- ratio_source_max 0.0
- ratio_repeat_avg -0.0
- ratio_repeat_min -0.0
- ratio_repeat_q1 -0.0
- ratio_repeat_med -0.0
- ratio_repeat_q3 -0.0
- ratio_repeat_max -0.0

r2: 0.9999999932192214
```

# Now to be fancy--I'll train on one and test on another
## train on subset, test on full
### AUC, alpha = 0.5
```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_subsetted_data/search_0_metrics.csv 3 best_auc 0.5 metric_analysis/trial2/cv_full_datasets/full_model_metrics.csv 
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

r2: -90518.03713235466
```

### r1, alpha = 0.1
```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_subsetted_data/search_0_metrics.csv 3 best_r1 0.1 metric_analysis/trial2/cv_full_datasets/full_model_metrics.csv 
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

r2: -854725.9237415907
```

## train on full, test on subset
### AUC, alph=0.1
```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_full_datasets/full_model_metrics.csv 3 best_auc 0.1 metric_analysis/trial2/cv_subsetted_data/search_0_metrics.csv 
Lasso
intercept: 1.061552174001696
- num_triples -1.0155426777872866e-07
- num_sinks -6.606952800793232e-09
- num_sinks_no_dup 1.7806994770720737e-07
- num_sources -3.122491453467016e-08
- num_sources_no_dup 1.4181725792123995e-07
- num_repeats 5.109010513475293e-08
- num_repeats_no_dup -2.0649307922929413e-08
- sink_avg 0.0
- sink_min 0.0
- sink_q1 0.0
- sink_med 0.0
- sink_q3 0.0
- sink_max 6.256428244807752e-06
- source_avg 0.0
- source_min 0.0
- source_q1 0.0
- source_med 0.0
- source_q3 0.0
- source_max -6.9369400451111966e-09
- repeat_avg 0.0
- repeat_min 0.0
- repeat_q1 0.0
- repeat_med 0.0
- repeat_q3 0.0
- repeat_max 2.951695521712168e-07
- ratio_num_sinks -0.0
- ratio_num_sinks_no_dup -0.0
- ratio_num_sources -0.0
- ratio_num_sources_no_dup -0.0
- ratio_num_repeats 0.0
- ratio_num_repeats_no_dup -0.0
- ratio_sink_avg 0.0
- ratio_sink_min -0.0
- ratio_sink_q1 0.0
- ratio_sink_med 0.0
- ratio_sink_q3 0.0
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
- ratio_repeat_q3 -0.0
- ratio_repeat_max 0.0

r2: -342.79061492015796
```

### r1, alpha=0.5
```
python analyze_graph_struct_patterns.py metric_analysis/trial2/cv_full_datasets/full_model_metrics.csv 3 best_r1 0.5 metric_analysis/trial2/cv_subsetted_data/search_0_metrics.csv 
Lasso
intercept: -0.08815959490239356
- num_triples 1.1549120461622192e-07
- num_sinks 1.2457664359369636e-08
- num_sinks_no_dup -2.2741357400554769e-07
- num_sources 3.987741617144146e-08
- num_sources_no_dup -1.4956292186402396e-07
- num_repeats -4.539057668801153e-07
- num_repeats_no_dup 1.4326568121421676e-07
- sink_avg -0.0
- sink_min 0.0
- sink_q1 0.0
- sink_med -0.0
- sink_q3 -0.0
- sink_max -0.0
- source_avg -0.0
- source_min 0.0
- source_q1 0.0
- source_med 0.0
- source_q3 0.0
- source_max 1.9373578541224445e-07
- repeat_avg -0.0
- repeat_min 0.0
- repeat_q1 0.0
- repeat_med 0.0
- repeat_q3 0.0
- repeat_max -0.0
- ratio_num_sinks 0.0
- ratio_num_sinks_no_dup 0.0
- ratio_num_sources 0.0
- ratio_num_sources_no_dup 0.0
- ratio_num_repeats -0.0
- ratio_num_repeats_no_dup -0.0
- ratio_sink_avg -0.0
- ratio_sink_min -0.0
- ratio_sink_q1 -0.0
- ratio_sink_med -0.0
- ratio_sink_q3 -0.0
- ratio_sink_max -0.0
- ratio_source_avg -0.0
- ratio_source_min -0.0
- ratio_source_q1 -0.0
- ratio_source_med -0.0
- ratio_source_q3 -0.0
- ratio_source_max 0.0
- ratio_repeat_avg -0.0
- ratio_repeat_min -0.0
- ratio_repeat_q1 -0.0
- ratio_repeat_med -0.0
- ratio_repeat_q3 -0.0
- ratio_repeat_max -0.0

r2: -11.527004261334568
```
