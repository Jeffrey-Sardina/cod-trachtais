###############################
'''
May not be in the the pytorch-biggraph-gpu venv:
    conda install -c conda-forge faiss-gpu

Docs / original code source:
    https://torchbiggraph.readthedocs.io/en/latest/downstream_tasks.html#predicting-the-score-of-an-edge

Other:
    What is 400? num_dims I think??
'''
###############################

#Imports
import json
import h5py
import torch
import numpy as np
#import faiss
import sys
import torchbiggraph.model #ComplexDiagonalDynamicOperator, DotComparator

#Global vars
num_dims = 100
###############################
'''
From PytorchBigGraph docs:
"Predicting the score of an edge
As described in the From entity embeddings to edge scores section, the essential goal of the model at the code of PBG is to be able to assign a score to each triplet of source entity, target entity and relation type. Those scores should reflect the likelihood of that edge existing. PBG’s current code for calculating these scores is very intertwined with the code that samples negative edges and therefore it is hard to use a trained model just to predict scores.
The following code shows loads the data directly from the HDF5 files and manually calculate the score of Paris being the capital of France:"
'''
###############################
def get_dynamic_relations_count(dyn_rel_count_file):
    with open(dyn_rel_count_file, "rt") as tf:
        return int(tf.read().strip())

def load_affine_operator(dynamic_rel_count, model_h5_file):
    #Needs to be updated for affine, not complex diagonal

    # Load the operator's state dict
    with h5py.File(model_h5_file, "r") as hf:
        operator_state_dict = {
            "real": torch.from_numpy(hf["model/relations/0/operator/rhs/real"][...]),
            "imag": torch.from_numpy(hf["model/relations/0/operator/rhs/imag"][...]),
        }
    operator = torchbiggraph.model.AffineDynamicOperator(num_dims, dynamic_rel_count) # I think
    operator.load_state_dict(operator_state_dict)
    return operator

def load_entity_names(entity_names_file):
    # Load the names of the entities, ordered by offset.
    with open(entity_names_file, "rt") as tf:
        return json.load(tf)

def load_rel_type_names(dyn_rel_names_file):
    # Load the names of the relation types, ordered by index.
    with open(dyn_rel_names_file, "rt") as tf:
        return json.load(tf)

def load_embeddings(embeddings_h5_file, src_entity_offset, dest_entity_offset):
    # Load the trained embeddings
    with h5py.File(embeddings_h5_file, "r") as hf:
        src_embedding = torch.from_numpy(hf["embeddings"][src_entity_offset, :])
        dest_embedding = torch.from_numpy(hf["embeddings"][dest_entity_offset, :])
    return src_embedding, dest_embedding

def calc_edge_scores(comparator, operator, src_embedding, dest_embedding, rel_type_index):
    # Calculate the scores
    return comparator(
        comparator.prepare(src_embedding.view(1, 1, num_dims)),
        comparator.prepare(
            operator(
                dest_embedding.view(1, num_dims),
                torch.tensor([rel_type_index]),
            ).view(1, 1, num_dims),
        ),
        torch.empty(1, 0, num_dims),  # Left-hand side negatives, not needed
        torch.empty(1, 0, num_dims),  # Right-hand side negatives, not needed
    )

def predict_edge_score(args):
    #Load CLI data
    dyn_rel_count_file = args[0]
    model_h5_file = args[1]
    entity_names_file = args[2]
    dyn_rel_names_file = args[3]
    embeddings_h5_file = args[4]
    src_entity = args[5]
    relation = args[6]
    dest_entity = args[7]

    #Gather model data
    dynamic_rel_count = get_dynamic_relations_count(dyn_rel_count_file)
    operator = load_affine_operator(dynamic_rel_count, model_h5_file)
    comparator = torchbiggraph.model.DotComparator()

    entity_names = load_entity_names(entity_names_file)
    src_entity_offset = entity_names.index(src_entity)
    dest_entity_offset = entity_names.index(dest_entity)

    rel_type_names = load_rel_type_names(dyn_rel_names_file)
    rel_type_index = rel_type_names.index(relation)

    src_embedding, dest_embedding = load_embeddings(embeddings_h5_file, src_entity_offset, dest_entity_offset)

    #Output scores
    scores, _, _ = calc_edge_scores(comparator, operator, src_embedding, dest_embedding, rel_type_index)
    print(scores)

###############################
'''
From PytorchBigGraph docs:
"Ranking
A very related problem is, given a source entity and a relation type, ranking all the entities by how likely they are to be the target entity. This can be done very similarly to the above. For example, the following code determines what entities are most likely to be the capital of France:"
'''
###############################
def load_entty_count(entity_count_file):
    # Load entity count
    with open(entity_count_file, "rt") as tf:
        return int(tf.read().strip())

def calc_target_scores(comparator, operator, src_embedding, dest_embeddings, rel_type_index, entity_count):
    # Calculate the scores
    return comparator(
        comparator.prepare(src_embedding.view(1, 1, num_dims)).expand(1, entity_count, num_dims),
        comparator.prepare(
            operator(
                dest_embeddings,
                torch.tensor([rel_type_index]).expand(entity_count),
            ).view(1, entity_count, num_dims),
        ),
        torch.empty(1, 0, num_dims),  # Left-hand side negatives, not needed
        torch.empty(1, 0, num_dims),  # Right-hand side negatives, not needed
    )

def load_embeddings_ranking(embeddings_h5_file, src_entity_offset):
    # Load the trained embeddings
    with h5py.File(embeddings_h5_file, "r") as hf:
        src_embedding = torch.from_numpy(hf["embeddings"][src_entity_offset, :])
        dest_embeddings = torch.from_numpy(hf["embeddings"][...])
    return src_embedding, dest_embeddings

def predict_targets_scores(args):
    #Load CLI data
    dyn_rel_count_file = args[0]
    entity_count_file = args[1]
    model_h5_file = args[2]
    entity_names_file = args[3]
    dyn_rel_names_file = args[4]
    src_entity = args[5]
    relation = args[6]
    embeddings_h5_file = args[7]
    top_n = int(args[8])

    #Gather model data
    dynamic_rel_count = get_dynamic_relations_count(dyn_rel_count_file)
    entity_count = load_entty_count(entity_count_file)
    operator = load_affine_operator(dynamic_rel_count, model_h5_file)
    comparator = torchbiggraph.model.DotComparator()

    entity_names = load_entity_names(entity_names_file)
    src_entity_offset = entity_names.index(src_entity)

    rel_type_names = load_rel_type_names(dyn_rel_names_file)
    rel_type_index = rel_type_names.index(relation)

    src_embedding, dest_embeddings = load_embeddings_ranking(embeddings_h5_file, src_entity_offset)

    #Get scores
    scores, _, _ = calc_target_scores(comparator, operator, src_embedding, dest_embeddings, rel_type_index, entity_count)
    permutation = scores.flatten().argsort(descending=True) # Sort the entities by their score
    
    #Output top targets
    top_entities = [entity_names[index] for index in permutation[:top_n]]
    print(top_entities)

###############################
'''
From PytorchBigGraph docs:
"Nearest neighbor search
Another common task is finding the entities whose embeddings are the closest to a given target vector. In order to do the actual search, we will use the FAISS library. The following code looks for the entities that are closest to Paris:"
'''
###############################
# Create FAISS index
def create_faiss_index(embeddings_h5_file):
    index = faiss.IndexFlatL2(num_dims)
    with h5py.File(embeddings_h5_file, "r") as hf:
        index.add(hf["embeddings"][...])
    return index

def load_target_embedding(embeddings_h5_file, target_entity_offset):
    with h5py.File(embeddings_h5_file, "r") as hf:
        return hf["embeddings"][target_entity_offset, :]

def find_nearest_neighbors(args):
    #Load CLI data
    embeddings_h5_file = args[0]
    entity_names_file = args[1]
    target_entity = args[2]
    top_n = args[3]

    #Gather model data
    index = create_faiss_index(embeddings_h5_file)
    entity_names = load_entity_names(entity_names_file)
    target_entity_offset = entity_names.index(target_entity)  # Paris
    target_embedding = load_target_embedding(embeddings_h5_file, target_entity_offset)


    # Search nearest neighbors
    _, neighbors = index.search(target_embedding.reshape((1, num_dims)), top_n)

    # Map back to entity names
    top_entities = [entity_names[index] for index in neighbors[0]]

    #Output results
    print(top_entities)

###############################
'''
Decide which of the 3 modes to use, then make predictions
Must del the first item in args so theother code runs as intended
'''
###############################
if __name__ == '__main__':
    mode = sys.argv[1]
    num_dims = sys.argv[2]
    args = sys.argv[3:]

    if mode == 'edge_score':
        predict_edge_score(args)
    elif mode == 'ranking':
        predict_targets_scores(args)
    elif mode == 'nn':
        find_nearest_neighbors(args)
    else:
        raise ValueError('Unknown mode, cannot make predictions')
    exit(0)
