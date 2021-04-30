#!/usr/bin/env python3

'''
Cruthaigh athróga timpeallachta!!
'''

def get_torchbiggraph_config():
    config = dict(
        # I/O data
        entity_path= "../cóipeanna/goa/scoilt_pbg",
        edge_paths=[
            "../cóipeanna/goa/scoilt_pbg/próiseáilte/sonraí_traenála_próiseáilte",
            "../cóipeanna/goa/scoilt_pbg/próiseáilte/sonraí_tástála_próiseáilt",
            "../cóipeanna/goa/scoilt_pbg/próiseáilte/sonraí_deimhnithe_próiseáilte",
        ],
        checkpoint_path="pointí_aiscurtha/goa",

        # Graph structure
        entities={"all": {"num_partitions": 1}},
        relations=[
            {
                "name": "all_edges",
                "lhs": "all",
                "rhs": "all",
                "operator": "complex_diagonal",
            }
        ],
        dynamic_relations=True,

        # Scoring model
        dimension=400,
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
