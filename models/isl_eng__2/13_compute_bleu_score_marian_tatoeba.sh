#!/bin/bash -v

# set chosen gpus
GPUS="0"
if [ $# -ne 0 ]
then
    GPUS=$@
fi
echo Using GPUs: $GPUS

SRC_ISO1="is"
TRG_ISO1="en"
SRC_ISO3="isl"
TRG_ISO3="eng"

MARIAN_DECODER="/home/wran/marian-dev/build/marian-decoder"
PATH_MODEL_FOLDER="/home/wran/models/${SRC_ISO3}_${TRG_ISO3}__1621844128"

PATH_TATOEBACHALLENGE="/home/wran/data/${SRC_ISO3}_${TRG_ISO3}/tatoeba-challenge"
NAME_AFFIXE_TATOEBA="test"

PATH_OUTPUT="${PATH_MODEL_FOLDER}/${NAME_AFFIXE_TATOEBA}.${SRC_ISO1}-${TRG_ISO1}.${TRG_ISO1}.output"

$MARIAN_DECODER \
-c "${PATH_MODEL_FOLDER}/model.npz.best-chrf.npz.decoder.yml" \
--maxi-batch-sort src \
--mini-batch-words 1000 \
--maxi-batch 64 \
--normalize 1 \
--devices $GPUS \
--input "${PATH_TATOEBACHALLENGE}/${NAME_AFFIXE_TATOEBA}.${SRC_ISO1}-${TRG_ISO1}.${SRC_ISO1}.txt" \
--output $PATH_OUTPUT \
# --cpu-threads 8 \
# --mini-batch 8 \



source ~/venvs/sacrebleu-venv/bin/activate 
cat "${PATH_OUTPUT}" | \
    sacrebleu "${PATH_TATOEBACHALLENGE}/${NAME_AFFIXE_TATOEBA}.${SRC_ISO1}-${TRG_ISO1}.${TRG_ISO1}.txt"