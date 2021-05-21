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
            search_iteration = val
    
    return params, search_iteration

def get_val_for_iteration(search_iteration):
    '''
    This should be the only hard-coded part
    '''
    lr_options = [1e-2, 1e-3, 1e-4]
    regularization_coef_options = [1e-1, 1e-3, 1e-5]
    loss_fn_options = ['ranking', 'softmax']
    operator_options = ['translation', 'affine', 'diagonal']
    comparator_options = ['dot', 'l2']

    permutation = None
    i = 0
    for lr in lr_options:
        for regularization_coef in regularization_coef_options:
            for loss_fn in loss_fn_options:
                for operator in operator_options:
                    for comparator in comparator_options:
                        if i == search_iteration:
                            permutation = [lr, regularization_coef, loss_fn, operator, comparator]
                            break
                        i += 1

    if not permutation:
        raise ValueError('invalid search_iteration value. Note: it must start at 0')
    return permutation

def get_torchbiggraph_config():
    params, i = load_params()
    lr_i, regularization_coef_i, loss_fn_i, operator_i, comparator_i = get_val_for_iteration(i)

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
        batch_size=1000,
        num_batch_negs=50,
        num_uniform_negs=50,
        loss_fn=loss_fn_i,
        lr=lr_i,
        regularization_coef=regularization_coef_i,

        # Evaluation during training
        eval_fraction=0,

        # GPU
        num_gpus=1,
    )

    return config