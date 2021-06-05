install.packages('rgl')
library('rgl')

df = read.csv("iterations/it_1/rounds/round3_4000_2part/models/pharmgkb_randsub_4000/evals.csv")
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

clean_df <- function(df, metic)
{
    res = df[c(1:2, which(colnames(df)==metic))]
    res
}

order_by_metric <- function(df, metic)
{
    auc_desc = df[order(-df[metic]), ]
    res = auc_desc[c(1:2, which(colnames(df)==metic))]
    res
}

order_by_metric_incl <- function(df, metic, incl)
{
    auc_desc = df[order(-df[metic]), ]
    res = auc_desc[c(1:2, which(colnames(df)==incl))]
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

### For Bioportal

#Overall (all 5) (200e, 50d) is not too bad.
cleaned = clean_df(df, 'auc')
cleaned

restricted = order_by_metric(df, 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==10, ]
plot(restricted$epochs, restricted$auc)
restricted
