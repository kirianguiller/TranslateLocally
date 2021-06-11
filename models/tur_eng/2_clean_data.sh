#!/bin/bash

source ./0_env.sh

PATH_TRAIN_PARTS="/${PATH_DATA}/${SRC_ISO3}_${TRG_ISO3}/mtdata/train-parts"
PATH_CLEAN_SCRIPTS="/${PATH_TRANSLATE_LOCALLY}/clean/"

cd $PATH_CLEAN_SCRIPTS

for corpus_name in \
    "cc_aligned" \
    "OPUS_Tanzil_v1" \
    "OPUS_EUbookshop_v2" \
    "OPUS_GNOME_v1" \
    "OPUS_KDE4_v2" \
    "OPUS_OpenSubtitles_v2018" \
    "OPUS_QED_v2_0a" \
    "OPUS_TildeMODEL_v2018" \
    "OPUS_Ubuntu_v14_10" \
    "WikiMatrix_v1" ; do

    echo "handling ${corpus_name} ..."
    . clean-corpus.sh \
       "${PATH_TRAIN_PARTS}/${corpus_name}-${SRC_ISO3}_${TRG_ISO3}" 
    
    echo "finished ${corpus_name} !"

  done