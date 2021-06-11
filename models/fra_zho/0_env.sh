#!/bin/bash
set -x

PATH_TRANSLATE_LOCALLY="/root/projects/NMT/TranslateLocally"
PATH_DATA="/tank/datasets/translation/cheepl"
PATH_MODELS="/tank/models/translation/cheepl"
PATH_PREPROCESS_DEDUP="/root/preprocess/build/bin/dedupe"
PATH_MARIAN_BUILD="/root/marian/build/"

SRC_ISO3="fra"
TRG_ISO3="zho"

SRC_ISO1="fr"
TRG_ISO1="zh"

SRC_BPE47="fr"
TRG_BPE47="zh-CN"

LIST_DATASETS="\
OPUS_NewsCommentary_v14 \
OPUS_MultiUN_v1 \
OPUS_OpenSubtitles_v2016 \
OPUS_WikiMatrix_v1 \
OPUS_Tanzil_v1 \
OPUS_TED2020_v1 \
OPUS_bibleuedin_v1 \
OPUS_Ubuntu_v14_10 \
"

PATH_DATA_PAIR="${PATH_DATA}/${SRC_ISO3}_${TRG_ISO3}"
PATH_MODEL_PAIR="${PATH_MODELS}/${SRC_ISO3}_${TRG_ISO3}"

MINI_BATCH_FIT=20000
GPUS="0 1"