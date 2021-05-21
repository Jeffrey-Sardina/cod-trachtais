#!/bin/bash

##Goal: do a search on hyperparameters (and model) space to try to find some ideal values
#This code should be read-only wrt the data in ../copies/*

# $ 1 => ainm fillteán i "copies/" (ms dbsnp)
# $ 2 => uuid
# $ 3 => scrios seancomhaid (1) nó ná scrios (0)
# $ 4 => áit tosaithe
    # 1 : comhbhrú
    # 2 : réamh-phroiseáil
    # 3 : leabú
    # 4 : scrúdú
    # 5 : aschur mar .tsv agus díchombhrú
# $ 5 : comhad cumraíochta
# $ 6 uimhir "partitions"

./pbg_pipeline.sh orphanet linear1 1 1 config/general.py 2

