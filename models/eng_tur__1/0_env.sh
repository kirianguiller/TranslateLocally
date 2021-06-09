#!/bin/bash

PATH_TRANSLATE_LOCALLY="/root/projects/NMT/TranslateLocally"
PATH_DATA="/tank/datasets/translation/cheepl"
PATH_MODELS="/tank/models/translation/cheepl/"
PATH_PREPROCESS_DEDUP="/root/preprocess/build/bin/dedupe"
PATH_MARIAN_BUILD="/root/marian/build/"

SRC_ISO3="eng"
TRG_ISO3="tur"

SRC_ISO1="en"
TRG_ISO1="tr"

PATH_DATA_PAIR="${PATH_DATA}/${SRC_ISO3}_${TRG_ISO3}"
PATH_MODEL_PAIR="${PATH_MODELS}/${SRC_ISO3}_${TRG_ISO3}"

MINI_BATCH_FIT=20000
GPUS="0 1"