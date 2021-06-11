# Úsáideann an cód seo eolas ó calc_graph_stats.sh
# Caithfidh mé eolas ar r1 / auc a chur isteach ansan freisin

import sys
import pandas as pd
import numpy as np
from sklearn.linear_model import Lasso
from sklearn.metrics import mean_squared_error, r2_score
from sklearn.model_selection import KFold

def cross_validate_alpha(alphas, fold, X, y):
    kf = KFold(n_splits=fold, shuffle=True)
    mean_errors = []
    std_errors = []
    for alpha in alphas:
        model = Lasso(alpha=alpha)
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
    plt.show()

def print_params(model, title):
    print(title)
    print(str(model.intercept_))
    for coef in model.coef_:
        print(str(coef))
    print()

def cross_val(X, y):
    fold = 3 #10
    alphas = [1e1, 1, 1e-1, 1e-2, 1e-3]
    mean_errors, std_errors = cross_validate_alpha(alphas, fold, X, y)
    plot_alpha_cross_validation(alphas, mean_errors, std_errors, 'Lasso, k=10')

def analyze(X, y, alpha):
    #Faigh eolas
    model = Lasso(alpha=alpha).fit(X, y)
    ypred = model.predict(X)
    r2 = r2_score(y, ypred)

    #Aschur sonraí
    print_params(model, 'Lasso')
    print('r2:', r2)
    return model

def load_data(csv_file, target):
    data = pd.read_csv(csv_file, comment='#')
    for i in range(len(data)):
        data.loc[i] = data.loc[i] / data.loc[i][0]
    del data['num_triples']
    y = data[target].to_numpy()
    del data[target]
    X = data.to_numpy()
    return X, y

if __name__ == '__main__':
    #lódáil sonraí
    csv_file = sys.argv[1]
    do_cross_val = sys.argv[2] == '1'
    target = sys.argv[3]
    X, y = load_data(csv_file, target)

    #Déan anailísíocht
    if do_cross_val:
        cross_val(X, y)
    else:
        alpha = float(sys.argv[4])
        model = analyze(x, y, alpha)
    exit(0)
