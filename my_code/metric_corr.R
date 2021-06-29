#Load data; https://stackoverflow.com/questions/5788117/only-read-selected-columns
df = read.csv("my_code/metric_analysis/centrality/centrality_quantiles_norm_to_triples.csv", sep=',')
df = read.csv("my_code/metric_analysis/centrality/centrality_quantiles.csv", sep=',')

df[] <- lapply(df, as.numeric)
head(df)

explanatory = df[c(1:18)]
head(explanatory)

response = df[c(21:23)]
head(response)

pairs(response)
cor(response)

cor(explanatory, response)^2
