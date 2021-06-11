#!/bin/bash
set -x
source ./0_env.sh
# it will load $PATH_PREPROCESS_DEDUP, $PATH_DATA, $SRC_ISO3 and $TRG_ISO3


PATH_TRAIN_PARTS="${PATH_DATA}/${SRC_ISO3}_${TRG_ISO3}/mtdata/train-parts"

for LNG_ISO3 in $SRC_ISO3 $TRG_ISO3;
  do

  gzip -cd ${PATH_TRAIN_PARTS}/*${LNG_ISO3}.clean.gz > "${PATH_TRAIN_PARTS}/${LNG_ISO3}.clean.txt"

  done


${PATH_PREPROCESS_DEDUP} "${PATH_TRAIN_PARTS}/${SRC_ISO3}.clean.txt" "${PATH_TRAIN_PARTS}/${TRG_ISO3}.clean.txt" \
    "${PATH_TRAIN_PARTS}/${SRC_ISO3}.clean.dedup.txt" "${PATH_TRAIN_PARTS}/${TRG_ISO3}.clean.dedup.txt"
