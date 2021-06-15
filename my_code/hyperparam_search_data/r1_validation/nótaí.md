# Round 1
## General notes
Method:
1. average all the data (average_evals.py)
2. use SQL to sort by max r1 and look for patterns

The best hyperparams seem to differ by dataset; however, there are some overall similar trends.
- the diagonal operator is never the best
- Oher values vary widely
Thus, I conclude that it will be necessary to construct separate models in some regard. However, I still hope that the most cirical peices (ie,m operator) may be conserved accross datasets.
- translation and l2 are optimal or near-optimal in all cases except for pharmgkb
- pharmgkb works well with translation and dot and softmax
- dbsp, drugbank, and omim all prefer softmax with translation and l2; bioportal prefers ranking

So overall, I keep seeing softmax-translation-l2 coming up. As a metter of foact, this does work for them all, although it's non-optimality is statistically significant on bioportal (it is not in the other cases; see avg and std files). Still, that gives bioportal an r1 of over 0.2, which is on the higher end of its values for sure. However, this is quite a bit lower than ranking,translation,l2, even considering the standard deviation of that point.

Thus, I think softmax-translation-l2 is a good basis for commonality. LR and REG, however, will almost certainly differ.

## Notes on lr and reg
Method:
1. average all the data (average_evals.py)
2. use cross_val_polot.py to look for hyperparam patterns given softmax-translation-l2

Code:
```
echo bioportal
python cross_val_plot.py \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/bioportal_randsub_4000_all.csv \
    r1 lr-log reg-log \
    operator -eq translation \
    loss_fn -eq softmax \
    comparator -eq l2
```
From this, I like lr = 1e-2 and reg = 1e-1 for the low STD and the high average. Most others are poor options; notably, the lr = 1e-2 ore 1e-4 and reg = 1e-3 that seems to work well for the rest almost certainly does not work well here.

Code: 
```
echo dbsnp
python cross_val_plot.py \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/dbsnp_randsub_4000_all.csv \
    r1 lr-log reg-log \
    operator -eq translation \
    loss_fn -eq softmax \
    comparator -eq l2
```
From this, I like lr = 1e-2 and reg = 1e-3 for the low STD and the high average; all others seem like bad choices. lr= 1e-4 is an exception to that; it would be very good except for one point that is notably lower in r1 than all the rest. However, it is likely not statistically significant from lr = 1e-2.

Code:
```
echo drugbank
python cross_val_plot.py \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/drugbank_randsub_4000_all.csv \
    r1 lr-log reg-log \
    operator -eq translation \
    loss_fn -eq softmax \
    comparator -eq l2
```
From this, I like lr = 1e-4 and reg = 1e-3 for the low STD and the high average. lr = 1e-2 is also ok, but slightly worse (though that would not be statistically significant, I don't think)

Code:
```
echo omim
python cross_val_plot.py \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/omim_randsub_4000_all.csv \
    r1 lr-log reg-log \
    operator -eq translation \
    loss_fn -eq softmax \
    comparator -eq l2
```
From this, I like lr = 1e-4 and reg = 1e-3 for the low STD and the high average. lr = 1e-2 is also ok, but notably worse (probably not statistically significant, however. Still, the difference is enough to make me prefer not using lr = 1e-2)

Code:
```
echo pharmgkb
python cross_val_plot.py \
    ../iterations_search_0/cumulative/its_1_2_and_3/round1/pharmgkb_randsub_4000_all.csv \
    r1 lr-log reg-log \
    operator -eq translation \
    loss_fn -eq softmax \
    comparator -eq l2
```
From this, I like lr = 1e-4 and reg = 1e-3 for the low STD and the high average. lr = 1e-2 is also good, maybe slightly worse (THey look nearly identical, however). All others look like very bad choices.

## Going forwards
I think I'll train 2 versions of bioportal: 1 with ranking and one with softmax. Both will otherwise use identical hyperparameters.

I'll then train all the rest on softmax-translation-l2 with lr = 1e-4 and reg = 1e-3 (lower lr tends to get to betteroptima and should not overfit; I can reconsider this WRT time later if needed)

In the next round of validation, we'll see what the data tells us.
