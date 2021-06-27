# README
This project contains all the code and data for my M.Sc. thesis at TCD. This file aims to explain the purpose of (mostly) all the files and folders inside, to serve as a reference for when I an wrting my thesis. 

## Apart from my_code/ (not in GibHub due to size limits)
### In copies/
This is a semi-working directory, semi-data storage directory. It contains copies of original Bio2RDF data (from original/), as well as created data subsets (during training).

### In iterations_search_0/
This is a data storage directory for all data relating to the first search for hyperparameters (based on AUC as a validating metric).

### In iterations_search_1/
This is a data storage directory for most data relating to the second search for hyperparameters (based on r1 as a validating metric). Since its round 1 would be identical for all iterations to  round 1 of the iterations in iterations_search_0/, that data should be taken directly from iterations_search_0/ and is not copied into this directory to allow maintenence of a single source of truth.

### In models/
This is a working directory used during training. It contains the .evallog and trainlog files that are used a logs of the training process and the final evalution.

### Other locations
old/ contains old code that is not longer needed in any respect. original/ contains datasets downloaded from Bio2RDF, which should never be changed (only copies and then used). .vscode/ is VS Code metadata (irrelevant to the project).

## In my_code/
### Folders
There are several folders in my_code/, most of which are active working directories (for code or written notes) whose contents should by synced to GitHub. These folders are:
- backup_points/ (ignored by Git)
    - Contains back-up points to the currently training models.
- config/
    - Contains all config files for the various hyperparameter searches and real training rounts.
- hyperparam_search_data/
    - Contains a few data files and analysis scipts aimed at understanding the results of hyperparwemter selection rounds. This was used for the CV of it_1 round1. Any new data added in should be moved to a clearly sepearate subfolder. 
- metric_analysis/
    - Contains ML analysis of how various graph structure metrics relate to AUC and r1 scroes used in CV. trial1/ is for an older trial using fewer metrics; trial2 uses many more metrics since trial1 failed to find any reliable relationships.
- nótaí/
    - Written thesis notes, cuid mhór ann i nGaeilge
- pytorch-biggraph-gpu/
    - venv containing a PBG dist for training
- pytorch-biggraph-gpu-writepatch/
    - venv containing a dist of PBG that can write data for affine operators. COuld proabably be used for t4raining, but I'll stick with the above for consistency. Training for the 2 should be identical anyway.

### Scripts
There as several master scripts, the rest of which are sub-routines that are called bu those master scripts. Depending on how large of a job I want to run, some of those sub-routintes may be run as their own routines as well, which muddles the definition of master vs sub- routines. However, in general there is a set mroe commonly used as master scripts, and a set more commonly used as subroutines.

Finally, there is a third category of scripts that stand on their own, often because they need human intervention and are not fully automated (such as cross-validation). Fully auto-mating those is beyond the scope of this work.

Master scripts (major pipelines):
- For data compression (preprocessing)
    - compress_copy.sh
        - Compresses a dataset in ../copies/, using to_compressed_nt.sh as a subroutine. It then cleans up the directory, optionally deleting uncompressed files 
    - to_compressed_nt.sh
        - Takes an input nq file and outputs a tab-delimited, compressed nt file. It can do this by normal (all in RAM) or sharded (using shards on-disk) compression, depending on data size. After each round, it verifies that all files have the expected structure to help ensure early error detection.
        - main subroutines:
            - nq_to_tsv.py
            - numcols.py
            - shard_file.sh
            - shard_compress.py
            - compress.py
- For hyperparameter selection and analysis:
    - run_rounds.sh
        - runs one or more rounds of hyperparameter validation search on biopoortal, dbsnp, drugbank, omim, and pharmgkb. It manages moving all relevant files to permanent locations after training.
    - run_round.sh
        - often as a subroutine to run_rounds.sh, runs a saingle round and leaves the data in the ../copies or ../model working directory
    - hyperparam_search.sh
        - often as a subroutine to run_round.sh, actually runs all the PyTorch-BigGraph instructions needed to prepare, train, evaluate, and output models on the given data. This is the most granular script that is commonly used as a master script in this set.
        - main subroutines:
            - create_random_subset.py
            - pbg_preprocess_search.sh
            - output_training_results_search.sh
- For training on a full dataset (with given hyperparameters)
    - pbg_pipeline.sh
        - Runs the full PyTorch BigGraph pipeline on the dataset, wiht given hypermareters, and manages preprrocessing, evaluation and training as well. It may be started at multiple points ion teh case that some of the work has been done already.
        - main subroutines:
            - compress_copy.sh
            - pbg_preprocess.sh
            - output_training_results.sh
- For graph structure analysis
    - batch_graph_stats.sh
        - Creates a full CSV file for data on graph stats from training rounds (which are subsetted data sets) and from training on full datasets.
        - main subroutines:
            - calc_graph_stats.sh
    - calc_graph_stats.sh
        - Creates a summary of a great variety of figures relating to graph structure. Output is structured as a single line of a CSV file, with or without headers.
        - main subroutines:
            - calc_entity_freqs.py
            - calc_entity_degree_stats.py
    - analyze_graph_struct_patterns.py
        - Mostly a singleton, takes data from batch_graph_stats.sh and runs CV for full training to determine how the graph strucutre stats relate to AUC or r1 values.

One-off scripts
- Hyperparameter validation
    - hyperparam_analysis.R
        - A script used to select hyperparameters (using AUC as the goal metric) from it_1 round 1 of hyperparam_search_0. It is notated with the selected values, and thus is kept. The use of this script is now deprecated in favor of matplolib / python scripts.
    - hyperparam_analysis_r2.R
        - A script used to select hyperparameters (using AUC as the goal metric) from it_1 round 2 of hyperparam_search_0. It is notated with the selected values, and thus is kept. The use of this script is now deprecated in favor of matplolib / python scripts.
    - hyperparam_analysis_r3.R
        - A script used to select hyperparameters (using AUC as the goal metric) from it_1 round 3 of hyperparam_search_0. It is notated with the selected values, and thus is kept. The use of this script is now deprecated in favor of matplolib / python scripts.
    - cross_val_plot.py
        - Takes in an arbitrary evals.csv file from a cross-validation round and plots the given aprameters in 2D or 3D. Constraints may be given, such as to say onoly plotting points where a certain hyperparameter has a certain value. This script is now preferred over the R scripts mentioned above for its greater extensibility and usability. It should not be annotated with comments.
- Data downloading
    - download_bio2rdf.py
        - Automates downloading datasets from bio2rdf.org. Requires the Google Chrome dirver to be installed.
