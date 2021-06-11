#!/bin/bash

source ./0_env.sh

# you should define a $DATA in your environment
../../venv/bin/python3.7 -m mtdata get -l "${SRC_ISO3}-${TRG_ISO3}" -o "${PATH_DATA}/${SRC_ISO3}_${TRG_ISO3}/mtdata"  \
    --tr \
    "cc_aligned" \
    "OPUS_Tanzil_v1" \
    "OPUS_EUbookshop_v2" \
    "OPUS_GNOME_v1" \
    "OPUS_KDE4_v2" \
    "OPUS_OpenSubtitles_v2018" \
    "OPUS_QED_v2_0a" \
    "OPUS_TildeMODEL_v2018" \
    "OPUS_Ubuntu_v14_10" \
    "WikiMatrix_v1" \
