#!/bin/bash

source ./0_env.sh

# you should define a $DATA in your environment
../../venv/bin/python3.7 -m mtdata get -l "${SRC_ISO3}-${TRG_ISO3}" -o "${PATH_DATA}/${SRC_ISO3}_${TRG_ISO3}/mtdata"  \
    --tr $LIST_DATASETS
