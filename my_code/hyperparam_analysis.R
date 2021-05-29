install.packages('rgl')
library('rgl')

df = read.csv("rounds/round1/models/pharmgkb_randsub_4000/evals.csv")
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

metrics = data.frame(df$mrr,
    df$r1,
    df$r10,
    df$r50,
    df$auc,
    df$count)

pairs(metrics)
cor(metrics)

order_by_metric <- function(df, metic)
{
    auc_desc = df[order(-df[metic]), ]
    res = auc_desc[c(1:5, which(colnames(df)==metic))]
    res
}

#Fix all factors and exame lr and reg
#Trans
# 0.68 ranking, l2 (not confident in this, may be overfitting. Maybe 0.68)
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-3 
plot(by_auc$reg, by_auc$auc, log='x') #1e-1

# Few good, none beat 0.68 ranking, dot
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #
plot(by_auc$reg, by_auc$auc, log='x') #

# 0.71, likely by chance, softmax, l2
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-2
plot(by_auc$reg, by_auc$auc, log='x') #1e-3

# 0.68, likely by chance, softmax, dot
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-2
plot(by_auc$reg, by_auc$auc, log='x') #1e-5

#Affine
# 0.70 ranking, l2
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-4

# 0.72 ranking, dot
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-3

# all under 0.72 softmax, l2
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #

# All under 0.72 softmax, dot
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #

#Diagonal
# No combos beat what was seen before
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='diagonal', ]
by_auc
