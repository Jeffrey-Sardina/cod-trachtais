#!/usr/bin/env python3

def load_params():
    import os

    params = {}
    for key, val in os.environ.items():
        if key == "NUM_PARTITIONS":
            params[key] = int(val)
        if key == "DATA":
            params[key] = val
        if key == "UUID":
            params[key] = val
    
    return params

def get_torchbiggraph_config():
    params = load_params()

    config = dict(
        # I/O data
        entity_path= "../copies/" + params['DATA'] + "/pbg_split",
        edge_paths=[
            "../copies/" + params['DATA'] + "/pbg_split/imported/training_data",
            "../copies/" + params['DATA'] + "/pbg_split/imported/testing_data",
            "../copies/" + params['DATA'] + "/pbg_split/imported/validation_data",
        ],
        checkpoint_path="backup_points/" + params['DATA'] + "_" + params['UUID'],

        # Graph structure
        # Ba cheart go mbeadh méid_graif_eolais / num_partitions < 8GB (cuimhne CUDA)
        entities={"all": {"num_partitions": params["NUM_PARTITIONS"]}},
        relations=[
            {
                "name": "all_edges",
                "lhs": "all",
                "rhs": "all",
                "operator": "translation",
            }
        ],
        dynamic_relations=True,

        # Scoring model
        dimension=2,
        global_emb=False,
        comparator="dot",

        # Training
        num_epochs=50,
        batch_size=5000,
        num_uniform_negs=1000,
        loss_fn="softmax",
        lr=0.1,
        regularization_coef=1e-3,

        # Evaluation during training
        eval_fraction=0,

        # GPU
        num_gpus=1,
    )

    return config
