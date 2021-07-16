from mpl_toolkits import mplot3d
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import os
import sys

def load_data(evals_file, vars_to_limit, limit_types, limits):
    '''
    Load the data, possibly with some value limits
    '''
    data = pd.read_csv(evals_file, header=0)
    for i in range(len(vars_to_limit)):
        var = vars_to_limit[i]
        val = limits[i]
        if limit_types[i] == '-eq':
            data = data[data[var] == val]
        elif limit_types[i] == '-ne':
            data = data[data[var] != val]
        elif limit_types[i] == '-gt':
            data = data[data[var] > val]
        elif limit_types[i] == '-lt':
            data = data[data[var] < val]
    return data

def do_heatmap(data, z_var, x_var, y_var, vmin, vmax, title):
    '''
    z is response and will be represented by BW color
    x,y are explanatory

    Code adapted from open example code posted at: https://matplotlib.org/stable/gallery/images_contours_and_fields/image_annotated_heatmap.html
    '''
    #https://matplotlib.org/2.0.2/examples/pylab_examples/pcolor_demo.html
    #https://www.python-graph-gallery.com/191-custom-axis-on-matplotlib-chart
    x_items = data[x_var].astype(float)
    y_items = data[y_var].astype(float)
    x_items = x_items.drop_duplicates()
    y_items = y_items.drop_duplicates()

    #Create base heatmap matrix
    heatmap_shape = (len(x_items), len(y_items))
    heatmap_matrix = np.zeros(heatmap_shape)
    for i, x in enumerate(x_items):
        for j, y in enumerate(y_items):
            z_row = data[(data[x_var]==x) & (data[y_var]==y)]
            z = z_row[z_var]
            heatmap_matrix[i, j] = z

    #Cruthaigh íomhá
    plt.pcolormesh(heatmap_matrix, cmap='Greys', vmin=vmin, vmax=vmax)

    #Cuir téacs leis
    plt.title(title)
    plt.xlabel(x_var)
    plt.ylabel(y_var)
    x_tick_locations = [0.5 + a for a in np.arange(len(x_items))]
    y_tick_locations = [0.5 + a for a in np.arange(len(y_items))]
    plt.xticks(x_tick_locations, x_items, horizontalalignment='center')
    plt.yticks(y_tick_locations, y_items, horizontalalignment='right')
    
    #Taispeáin barra na ndathanna
    plt.colorbar()

    #Taispeáin an rud ar fad
    plt.show()

def do_3dplot(data, z_var, x_var, y_var, logs, title):
    '''
    z is response
    x,y are explanatory
    '''
    fig = plt.figure()
    ax = plt.axes(projection ='3d')

    # defining axes
    z = data[z_var].astype(float)
    x = data[x_var].astype(float)
    y = data[y_var].astype(float)

    if z_var in logs:
        z = np.log10(z)
        z_var = 'log(' + z_var + ')'
    if x_var in logs:
        x = np.log10(x)
        x_var = 'log(' + x_var + ')'
    if y_var in logs:
        y = np.log10(y)
        y_var = 'log(' + y_var + ')'

    ax.scatter(x, y, z)
    ax.set_xlabel(x_var)
    ax.set_ylabel(y_var)
    ax.set_zlabel(z_var, rotation='horizontal')

    ax.set_title(title)
    plt.show()

def do_2dplot(data, y_var, x_var, logs, title):
    '''
    y is response
    x is explanatory
    '''
    fig = plt.figure()
    ax = plt.axes()

    # defining axes
    y = data[y_var].astype(float)
    x = data[x_var].astype(float)

    if x_var in logs:
        x = np.log10(x)
        x_var = 'log(' + x_var + ')'
    if y_var in logs:
        y = np.log10(y)
        y_var = 'log(' + y_var + ')'

    ax.scatter(x, y)
    ax.set_xlabel(x_var)
    ax.set_ylabel(y_var)
    ax.set_title(title)
    plt.show()

def try_float(val):
    try:
        return float(val)
    except:
        return val

if __name__ == '__main__':
    #eolas ón úsáideoir
    evals_file = sys.argv[1]

    #lódáil réimse na luacha
    logs = []
    response_var = sys.argv[2]
    if '-log' in response_var:
        response_var = response_var.replace('-log', '')
        logs.append(response_var)

    x_var = sys.argv[3]
    if '-log' in x_var:
        x_var = x_var.replace('-log', '')
        logs.append(x_var)

    y_var = sys.argv[4] #NB (ná bac) nó ainm
    if '-log' in y_var:
        y_var = y_var.replace('-log', '')
        logs.append(y_var)

    if y_var == 'NB':
        constraints = sys.argv[5:]
    else:
        make_heatmap = sys.argv[5] == '1'
        vmin = float(sys.argv[6])
        vmax = float(sys.argv[7])
        constraints = sys.argv[8:]

    #lódáil eolas (le srianta, b'fhéidir)
    vars_to_limit = [] #ainm
    limit_types = [] #-eq, -ne, -gt, lt
    limits = [] #luach
    for i, item in enumerate(constraints):
        if i % 3 == 0:
            vars_to_limit.append(item)
        elif i % 3 == 1:
            limit_types.append(item)
        else:
            limits.append(try_float(item))
    data = load_data(evals_file, vars_to_limit, limit_types, limits)

    #cruthaigh graf
    title = os.path.basename(evals_file) + '\n' + ' '.join(x for x in constraints)
    if y_var == 'NB':
        do_2dplot(data, response_var, x_var, logs, title)
    else:
        if make_heatmap:
            do_heatmap(data, response_var, x_var, y_var, vmin, vmax, title)
        else:
            do_3dplot(data, response_var, x_var, y_var, logs, title)
