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

def get_cross_validated_epoch_values():
    '''
    This should be the only hard-coded part
    '''

    epochs = 200
    dimensions = 100
    
    return epochs, dimensions

def get_cross_validated_values():
    lr = 1e-4
    regularization_coef = 1e-3
    loss_fn = 'softmax'
    operator = 'translation'
    comparator = 'l2'
    return lr, regularization_coef, loss_fn, operator, comparator

def get_cross_validated_batch_values():
    batch_size = 500
    num_batch_negs = 100
    num_uniform_negs = 250
    return batch_size, num_batch_negs, num_uniform_negs

def get_torchbiggraph_config():
    params, i = load_params()
    lr_i, regularization_coef_i, loss_fn_i, operator_i, comparator_i = get_cross_validated_values()
    batch_size_i, num_batch_negs_i, num_uniform_negs_i = get_cross_validated_batch_values()
    epochs_i, dimensions_i = get_cross_validated_epoch_values()

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
        dimension=dimensions_i,
        global_emb=False,
        comparator=comparator_i,

        # Training
        num_epochs=epochs_i,
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
