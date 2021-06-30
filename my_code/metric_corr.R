load_cor_norm = function()
{
    df = read.csv("my_code/metric_analysis/centrality/centrality_quantiles_norm_to_triples.csv", sep=',')
}

load_cor_raw = function()
{
    df = read.csv("my_code/metric_analysis/centrality/centrality_quantiles.csv", sep=',')
}

disp_cors = function(df)
{
    explanatory = df[c(1:18)]
    response = df[c(21:23)]
    print(cor(explanatory, response)^2)
}

disp_cors(load_cor_norm())
disp_cors(load_cor_raw())
