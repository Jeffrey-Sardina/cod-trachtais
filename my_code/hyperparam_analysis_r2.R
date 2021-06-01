install.packages('rgl')
library('rgl')

df = read.csv("rounds/round2/models/omim_randsub_4000/evals.csv")
df$lr = as.numeric(df$lr)
df$reg = as.numeric(df$reg)
df$loss = as.numeric(df$loss)
df$pos_rank = as.numeric(df$pos_rank)
df$mrr = as.numeric(df$mrr)
df$r1 = as.numeric(df$r1)
df$r10 = as.numeric(df$r10)
df$r50 = as.numeric(df$r50)
df$auc = as.numeric(df$auc)
df$count = as.numeric(df$count)
df

order_by_metric <- function(df, metic)
{
    auc_desc = df[order(-df[metic]), ]
    res = auc_desc[c(1:3, which(colnames(df)==metic))]
    res
}

order_by_metric_incl <- function(df, metic, incl)
{
    auc_desc = df[order(-df[metic]), ]
    res = auc_desc[c(1:3, which(colnames(df)==incl))]
    res
}


#Fix batch_size and exame batch and uniform negs
# ranking, l2 (not confident in this, may be overfitting. Maybe 0.68)
# by_auc = order_by_metric(df, 'auc')
# by_auc = by_auc[by_auc$batch_size==500, ]
# by_auc
# plot(by_auc$num_batch_negs, by_auc$auc) #
# plot(by_auc$num_uniform_negs, by_auc$auc) #
# plot3d(by_auc$num_batch_negs, by_auc$num_uniform_negs, by_auc$auc)

batch_s = 500
restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
plot3d(restricted$num_batch_negs, restricted$num_uniform_negs, restricted$auc)
restricted

batch_s = 1000
restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
plot3d(restricted$num_batch_negs, restricted$num_uniform_negs, restricted$auc)
restricted

batch_s = 1500
restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
plot3d(restricted$num_batch_negs, restricted$num_uniform_negs, restricted$auc)
restricted

batch_s = 2000
restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
plot3d(restricted$num_batch_negs, restricted$num_uniform_negs, restricted$auc)
restricted

### For Bioportal
#Batch size 500
#Tends to do better on higher num_batch_negs
batch_s = 500
restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==10, ]
#max when num_batch_negs = 500, 0.81
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==50, ]
#max when num_batch_negs = 500, 0.807
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==100, ]
#max when num_batch_negs = 500, 0.814
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==250, ]
#max when num_batch_negs = 10, 0.716
#num_batch_negs = 500 also very good, 0.709
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==500, ]
#max when num_batch_negs = 250, 0.775
#num_batch_negs = 500 also very good, 0.767
plot(restricted$num_batch_negs, restricted$auc)
restricted

#Batch size 1000
# Lower num_batch_negs tend to be favored
batch_s = 1000
restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==10, ]
#max when num_batch_negs = 250, 0.81
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==50, ]
#max when num_batch_negs = 250, 0.76
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==100, ]
#max when num_batch_negs = 50, 0.815
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==250, ]
#max when num_batch_negs = 50, 0.81
#num_batch_negs = 500 also very good, 0.709
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==500, ]
#max when num_batch_negs = 500, 0.74
#num_batch_negs = 500 also very good, 0.767
plot(restricted$num_batch_negs, restricted$auc)
restricted


#Batch size 1500
# Lower num_batch_negs tend to be favored again!
# ^^ VERY strong trend
batch_s = 1500
restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==10, ]
#max: num_batch_negs=10 => 0.79
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==50, ]
#max: num_batch_negs=10 => 0.80
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==100, ]
#max: num_batch_negs=10 => 0.80
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==250, ]
#max: num_batch_negs=500 => 0.78 (likely outlier)
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==500, ]
#max: num_batch_negs=10 => 0.73
plot(restricted$num_batch_negs, restricted$auc)
restricted

#Batch size 2000
# Lower num_batch_negs tend to be favored again!
# ^^ VERY strong trend
batch_s = 2000
restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==10, ]
#max: num_batch_negs=50 => 0.744
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==50, ]
#max: num_batch_negs=10 => 0.807
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==100, ]
#max: num_batch_negs=10 => 0.815
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==250, ]
#max: num_batch_negs=10 => 0.71
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==500, ]
#max: num_batch_negs=100 => 0.78
plot(restricted$num_batch_negs, restricted$auc)
restricted
