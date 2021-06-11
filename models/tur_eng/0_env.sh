#!/bin/bash

PATH_TRANSLATE_LOCALLY="/home/wran/TranslateLocally"
PATH_DATA="/tank/datasets/translation/cheepl"
PATH_MODELS="/tank/models/translation/cheepl"
PATH_PREPROCESS_DEDUP="/home/wran//preprocess/build/bin/dedupe"
PATH_MARIAN_BUILD="/home/wran/marian-dev/build"

SRC_ISO3="tur"
TRG_ISO3="eng"

SRC_ISO1="tr"
TRG_ISO1="en"

SRC_BPE47="tr"
TRG_BPE47="en"

PATH_DATA_PAIR="${PATH_DATA}/${SRC_ISO3}_${TRG_ISO3}"
PATH_MODEL_PAIR="${PATH_MODELS}/${SRC_ISO3}_${TRG_ISO3}"

MINI_BATCH_FIT=20000
GPUS="0 1 2 3 4 5 6 7"