#!/bin/bash

./pbg_pipeline.sh bioportal validated50e_100d_1 1 2 config/final.py 2
./pbg_pipeline.sh dbsnp validated50e_100d_1 1 2 config/final.py 2
./pbg_pipeline.sh drugbank validated50e_100d_1 1 2 config/final.py 2
