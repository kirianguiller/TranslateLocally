#!/bin/bash

source ./0_env.sh

PATH_TRAIN_PARTS="${PATH_DATA}/${SRC_ISO3}_${TRG_ISO3}/mtdata/train-parts"
PATH_CLEAN_SCRIPTS="${PATH_TRANSLATE_LOCALLY}/clean/"

cd $PATH_CLEAN_SCRIPTS

for corpus_name in $LIST_DATASETS; do

    echo "handling ${corpus_name} ..."
    . clean-corpus.sh \
       "${PATH_TRAIN_PARTS}/${corpus_name}-${SRC_ISO3}_${TRG_ISO3}" 
    
    echo "finished ${corpus_name} !"

  done