# Úsáideann an cód seo eolas ó calc_graph_stats.sh
# Caithfidh mé eolas ar r1 / auc a chur isteach ansan freisin

import sys
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import Lasso
from sklearn.metrics import mean_squared_error, r2_score
from sklearn.model_selection import KFold

max_iter=100_000

def cross_validate_alpha(alphas, fold, X, y):
    kf = KFold(n_splits=fold, shuffle=True)
    mean_errors = []
    std_errors = []
    for alpha in alphas:
        model = Lasso(alpha=alpha, max_iter=max_iter)
        MSEs = []
        for train, test in kf.split(X):
            model.fit(X[train], y[train])
            ypred = model.predict(X[test])
            MSEs.append(mean_squared_error(y[test], ypred))

        MSEs = np.array(MSEs)
        mean_errors.append(MSEs.mean())
        std_errors.append(MSEs.std())
    
    return mean_errors, std_errors

def plot_alpha_cross_validation(alphas, mean_errors, std_errors, title, model_id):
    plt.rc('font', size=18)
    plt.rcParams['figure.constrained_layout.use'] = True
    plt.errorbar(alphas, mean_errors, yerr=std_errors, linewidth=1)
    plt.xlabel('alphas')
    plt.ylabel('Mean square error')
    plt.title(title)
    plt.savefig('metric_analysis/struct_to_r1_or_auc/' + model_id + '.png')

def print_params(model, labels, title):
    print(title)
    print('intercept:', str(round(model.intercept_,4)))
    print('\t'.join(str(round(a, 4)) for a in model.coef_))

def cross_val(X, y, model_id):
    fold = 5
    alphas = [1, 0.5, 1e-1, 1e-2, 1e-3]
    mean_errors, std_errors = cross_validate_alpha(alphas, fold, X, y)
    plot_alpha_cross_validation(alphas, mean_errors, std_errors, 'Lasso Cross-Val, k=' + str(fold), model_id)

def analyze(X, y, alpha, labels):
    #Faigh eolas
    model = Lasso(alpha=alpha, max_iter=max_iter).fit(X, y)
    ypred = model.predict(X)
    r2 = r2_score(y, ypred)

    #Aschur sonraí
    print_params(model, labels, 'Lasso')
    print('r2:', str(round(r2, 4)))
    print()
    return model

def load_data(csv_file, target):
    data = pd.read_csv(csv_file, comment='#')
    del data['Dataset']

    #Faigh y
    if target != 'AUC' and target != 'r1':
        raise ValueError('Invalid target: ' + target)
    y = data[target].to_numpy()
    del data['AUC']
    del data['r1']

    #Normalize by mean
    X_norm = (data - data.mean()) / data.std()
    labels = X_norm.columns.values

    #If col is all 1s, norm will make them NA.
    #Change to zero is valid--mean of a norma dist is 0
    #So that is proper normalization
    #Not that the regressor cares what value if it if it is always the same
    X_norm = X_norm.fillna(0).to_numpy()

    return X_norm, y, labels

if __name__ == '__main__':
    #Le haghaidh eolas i metric_analysis/struct_to_r1_or_auc
    #lódáil sonraí
    training_file = sys.argv[1]
    mode = sys.argv[2]
    target = sys.argv[3]
    model_id = sys.argv[4]
    X, y, labels = load_data(training_file, target)

    #Déan anailísíocht
    if mode == '1': #Cross-val
        cross_val(X, y, model_id)
    elif mode == '2': #Eval on given dataset
        alpha = float(sys.argv[5])
        model = analyze(X, y, alpha, labels)
    exit(0)
