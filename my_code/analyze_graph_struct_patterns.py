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

def plot_alpha_cross_validation(alphas, mean_errors, std_errors, title):
    plt.rc('font', size=18)
    plt.rcParams['figure.constrained_layout.use'] = True
    plt.errorbar(alphas, mean_errors, yerr=std_errors, linewidth=1)
    plt.xlabel('alphas')
    plt.ylabel('Mean square error')
    plt.title(title)
    plt.savefig('metric_analysis/fig.png')
    #plt.show()

def print_params(model, labels, title):
    print(title)
    print('intercept:', str(model.intercept_))
    for i, coef in enumerate(model.coef_):
        print('-', labels[i], str(coef))
    print()

def cross_val(X, y):
    fold = 5
    alphas = [1, 0.5, 1e-1, 1e-2, 1e-3]
    mean_errors, std_errors = cross_validate_alpha(alphas, fold, X, y)
    plot_alpha_cross_validation(alphas, mean_errors, std_errors, 'Lasso, k=' + str(fold))

def analyze(X, y, alpha, labels):
    #Faigh eolas
    model = Lasso(alpha=alpha, max_iter=max_iter).fit(X, y)
    ypred = model.predict(X)
    r2 = r2_score(y, ypred)

    #Aschur sonraí
    print_params(model, labels, 'Lasso')
    print('r2:', r2)
    return model

def evaluate(X, y, alpha, labels, Xtest, ytest):
    #Faigh eolas
    model = Lasso(alpha=alpha, max_iter=max_iter).fit(X, y)
    ypred = model.predict(Xtest)
    r2 = r2_score(ytest, ypred)

    #Aschur sonraí
    print_params(model, labels, 'Lasso')
    print('r2:', r2)
    return model

def load_data(csv_file, target, keep_raw_numbers):
    data = pd.read_csv(csv_file, comment='#')

    #Faigh y
    if target != 'best_auc' and target != 'best_r1':
        raise ValueError('Invalid target: ' + target)
    y = data[target].to_numpy()
    del data['best_auc']
    del data['best_r1']

    ratio_df = data.copy()
    for i in range(len(ratio_df)):
        ratio_df.loc[i] = ratio_df.loc[i] / ratio_df.loc[i][0]
    del ratio_df['num_triples']
    ratio_df.columns = ['ratio_' + x for x in data.columns if x != 'num_triples']
    if keep_raw_numbers:
        full_data = pd.concat([data, ratio_df], axis=1) #data.merge(ratio_df, how='outer')
    else:
        full_data = ratio_df
    X = full_data.to_numpy()

    #Faigh teidil
    labels = full_data.columns.values

    return X, y, labels

if __name__ == '__main__':
    #lódáil sonraí
    training_file = sys.argv[1]
    mode = sys.argv[2]
    target = sys.argv[3]
    keep_raw_numbers = sys.argv[4] == '1'
    X, y, labels = load_data(training_file, target, keep_raw_numbers)

    #Déan anailísíocht
    if mode == '1': #Cross-val
        cross_val(X, y)
    elif mode == '2': #Eval on given dataset
        alpha = float(sys.argv[5])
        model = analyze(X, y, alpha, labels)
    elif mode == '3': #Train on one set, eval / apply on another
        alpha = float(sys.argv[5])
        test_file = sys.argv[6]
        Xtest, ytest, _ = load_data(test_file, target, keep_raw_numbers)
        model = evaluate(X, y, alpha, labels, Xtest, ytest)
    exit(0)
