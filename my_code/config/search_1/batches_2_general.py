#!/usr/bin/env python3

def load_params():
    import os

    params = {}
    search_iteration = 0
    for key, val in os.environ.items():
        if key == "NUM_PARTITIONS":
            params[key] = int(val)
        if key == "DATA":
            params[key] = val
        if key == "UUID":
            params[key] = val
        if key == "SEARCH_ITERATION":
            search_iteration = int(val)
    
    return params, search_iteration

def get_val_for_iteration(search_iteration):
    '''
    This should be the only hard-coded part
    '''
    import itertools

    batch_size = [500, 1000, 1500, 2000]
    num_batch_negs = [10, 50, 100, 250, 500]
    num_uniform_negs = [10, 50, 100, 250, 500]
    permutations = itertools.product(batch_size,
        num_batch_negs,
        num_uniform_negs)
    permutations = [x for x in permutations]

    for i, permutation in enumerate(permutations):
        if i == search_iteration:
            return permutation
    
    raise ValueError('invalid search_iteration value. Note: it must start at 0')

def get_cross_validated_values():
    lr = 1e-4
    regularization_coef = 1e-3
    loss_fn = 'softmax'
    operator = 'translation'
    comparator = 'l2'
    return lr, regularization_coef, loss_fn, operator, comparator

def get_torchbiggraph_config():
    params, i = load_params()
    lr_i, regularization_coef_i, loss_fn_i, operator_i, comparator_i = get_cross_validated_values()
    batch_size_i, num_batch_negs_i, num_uniform_negs_i = get_val_for_iteration(i)
    print(batch_size_i, num_batch_negs_i, num_uniform_negs_i)

    config = dict(
        # I/O data
        entity_path= "../copies/" + params['DATA'] + "/pbg_split",
        edge_paths=[
            "../copies/" + params['DATA'] + "/pbg_split/imported/training_data",
            "../copies/" + params['DATA'] + "/pbg_split/imported/testing_data",
            "../copies/" + params['DATA'] + "/pbg_split/imported/validation_data",
        ],
        checkpoint_path="backup_points/" + params['DATA'] + "_" + params['UUID'],

        # Structúr an Ghraif
        # Ba cheart go mbeadh méid_graif_eolais / num_partitions < 8GB (cuimhne CUDA)
        entities={"all": {"num_partitions": params["NUM_PARTITIONS"]}},
        relations=[
            {
                "name": "all_edges",
                "lhs": "all",
                "rhs": "all",
                "operator": operator_i,
            }
        ],
        dynamic_relations=True, #Toisc go bhfuil a lán faisnéisí agam

        # Scoring model
        dimension=100,
        global_emb=False,
        comparator=comparator_i,

        # Training
        num_epochs=100,
        batch_size=batch_size_i,
        num_batch_negs=num_batch_negs_i,
        num_uniform_negs=num_uniform_negs_i,
        loss_fn=loss_fn_i,
        lr=lr_i,
        regularization_coef=regularization_coef_i,

        # Evaluation during training
        eval_fraction=0,

        # GPU
        num_gpus=1,
    )

    if regularization_coef_i == None:
        del config['regularization_coef']

    return config
