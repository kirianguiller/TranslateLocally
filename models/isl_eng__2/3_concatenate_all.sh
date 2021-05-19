#!/bin/bash

SRC_ISO3="isl"
TRG_ISO3="eng"

PATH_DATA="/home/wran/data/${SRC_ISO3}_${TRG_ISO3}/mtdata/train-parts"
PATH_DEDUP="/home/wran/preprocess/build/bin/dedupe"

for LNG_ISO3 in $SRC_ISO3 $TRG_ISO3;
  do

  gzip -cd ${PATH_DATA}/*${LNG_ISO3}.clean.gz > "${PATH_DATA}/${LNG_ISO3}.clean.txt"

  
  done


${PATH_DEDUP} "${PATH_DATA}/${SRC_ISO3}.clean.txt" "${PATH_DATA}/${TRG_ISO3}.clean.txt" \
    "${PATH_DATA}/${SRC_ISO3}.clean.dedup.txt" "${PATH_DATA}/${TRG_ISO3}.clean.dedup.txt"
