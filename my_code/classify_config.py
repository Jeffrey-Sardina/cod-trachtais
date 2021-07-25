# dataset1: id:10--10-10-0 
# dataset2: id:10-10--10-0

'''
Things to include in assignemnts:
    ALWYAS do baselines
    Cross-validation analysis of hyperparameters

References:
    ROC curves for kNN: https://stackoverflow.com/questions/52910061/implementing-roc-curves-for-k-nn-machine-learning-algorithm-using-python-and-sci
'''

import sys
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import KFold
from sklearn.metrics import mean_squared_error, auc, roc_curve, confusion_matrix
from sklearn.dummy import DummyClassifier

max_iter=100_000

def print_params(model, labels, title):
    print(title)
    print('intercept:', str(round(model.intercept_[0], 4)))
    print('\t'.join(str(round(a, 4)) for a in model.coef_[0]))

def analyze(X, y, alpha, labels):
    #Select hyper-parameters and create model
    lr_model = LogisticRegression(penalty='l1', solver='liblinear', C=1/alpha, max_iter=max_iter).fit(X, y)

    #Create baselines
    majority_baseline = DummyClassifier('most_frequent').fit(X, y)

    #Get the confusion matricies for the models and baselines
    print('LR:')
    fpr, tpr, thresholds = roc_curve(y, lr_model.predict(X)) #https://scikit-learn.org/stable/modules/generated/sklearn.metrics.auc.html
    print(confusion_matrix(y, lr_model.predict(X)))
    print('AUC:', auc(fpr, tpr))
    print()

    print_params(lr_model, labels, 'Params:')
    print()

    print('Majority baseline:')
    fpr, tpr, thresholds = roc_curve(y, majority_baseline.predict(X)) #https://scikit-learn.org/stable/modules/generated/sklearn.metrics.auc.html
    print('AUC:', auc(fpr, tpr))
    print()


'''
This runs k-fold cross-validation (where k=5) for determining alpha, the coefficient of the L1 penalty term. The results of each roundn of validation are plotted on a graph, with error bars to represent standard deviation. The approproate alpha can then be manually determined from the graph.
'''
def cross_val(X, y, model_id):
    #Choose cross-validation parameters
    alphas = [1, 0.5, 1e-1, 1e-2, 1e-3]
    fold = 5

    #Get means and stdevs for all Cs using k-fold crosss-validation
    kf = KFold(n_splits=fold, shuffle=True)
    mean_errors = []
    std_errors = []
    for alpha in alphas:
        MSEs = []
        for train, test in kf.split(X):
            model = LogisticRegression(penalty='l1', solver='liblinear', C=1/alpha, max_iter=max_iter).fit(X[train], y[train])
            ypred = model.predict(X[test])
            MSEs.append(mean_squared_error(y[test], ypred))            
        MSEs = np.array(MSEs)
        mean_errors.append(MSEs.mean())
        std_errors.append(MSEs.std())

    #Plot the results
    plt.cla()
    plt.rc('font', size=18)
    plt.rcParams['figure.constrained_layout.use'] = True
    plt.errorbar(alphas, mean_errors, yerr=std_errors)
    plt.xlabel('alpha')
    plt.ylabel('Mean square error')
    plt.title('Cross-val on alpha, k=' + str(fold))
    plt.savefig('metric_analysis/config_classification/' + model_id + '.png', bbox_inches='tight')

'''
This function loads data from the given file as a numpy array. It is sued to collect hte training data to be used for the models.
'''
def load_data(csv_file):
    data = pd.read_csv(csv_file, comment='#')
    del data['Dataset']

    #Faigh y
    y = data['better_with_general'].to_numpy()
    del data['better_with_general']

    #Normalize by mean
    X_norm = (data - data.mean()) / data.std()
    labels = X_norm.columns.values

    #If col is all 1s, norm will make them NA.
    #Change to zero is valid--mean of a norma dist is 0
    #So that is proper normalization
    #Not that the regressor cares what value if it if it is always the same
    X_norm = X_norm.fillna(0).to_numpy()

    return X_norm, y, labels

def main():
    #Le haghaidh eolas i metric_analysis/struct_to_r1
    #lódáil sonraí
    training_file = sys.argv[1]
    mode = sys.argv[2]
    X, y, labels = load_data(training_file)

    #Déan anailísíocht
    if mode == '1': #Cross-val
        model_id = sys.argv[3]
        cross_val(X, y, model_id)
    elif mode == '2': #Eval on given dataset
        alpha = float(sys.argv[3])
        model = analyze(X, y, alpha, labels)
    exit(0)

if __name__ == '__main__':
    main()
