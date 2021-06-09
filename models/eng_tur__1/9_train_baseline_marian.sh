#!/bin/bash -v

source ./0_env.sh

# # set chosen gpus
# GPUS="0"
# if [ $# -ne 0 ]
# then
#     GPUS=$@
# fi
echo Using GPUs: $GPUS

SEED=2

MARIAN="${PATH_MARIAN_BUILD}/marian"

current_timestamp=$(date +%s)
PATH_MODEL_FOLDER="${PATH_MODEL_PAIR}/${SRC_ISO3}_${TRG_ISO3}__${current_timestamp}"

PATH_MTDATA="${PATH_DATA_PAIR}/mtdata/train-parts"
PATH_TATOEBACHALLENGE="${PATH_DATA_PAIR}/tatoeba-challenge"
# PATH_WMT21="/home/wran/data"

if [ -d "$PATH_MODEL_FOLDER" ]; then
  echo "Folder ${DIR} already exist, exiting the script"
  # exit 1
fi

# rm -r $PATH_MODEL_FOLDER # remove this if you want to continue training !!!
mkdir -p $PATH_MODEL_FOLDER

MODEL_TYPE="transformer"

# train model
$MARIAN \
    --model $PATH_MODEL_FOLDER/model.npz \
    --log "$PATH_MODEL_FOLDER/train.log" --valid-log "$PATH_MODEL_FOLDER/valid.log" \
    --type $MODEL_TYPE \
    --vocabs "${PATH_MTDATA}/source.spm" "${PATH_MTDATA}/target.spm" \
    --train-sets "${PATH_MTDATA}/${SRC_ISO3}.clean.dedup.txt" "${PATH_MTDATA}/${TRG_ISO3}.clean.dedup.txt" \
    --seed $SEED \
    --valid-sets "${PATH_TATOEBACHALLENGE}/dev.${SRC_ISO1}-${TRG_ISO1}.${SRC_ISO1}.txt" "${PATH_TATOEBACHALLENGE}/dev.${SRC_ISO1}-${TRG_ISO1}.${TRG_ISO1}.txt" \
    --valid-translation-output "$PATH_MODEL_FOLDER/dev.${SRC_ISO1}-${TRG_ISO1}.${TRG_ISO1}.txt.output" \
    --devices $GPUS \
    --mini-batch-fit -w ${MINI_BATCH_FIT} \
    --max-length 100 \
    --maxi-batch 4000 \
    --optimizer-delay 1 \
    --valid-freq 5000 \
    --save-freq 5000 \
    --disp-freq 2500 \
    --valid-metrics chrf bleu perplexity cross-entropy \
    --valid-mini-batch 64 \
    --beam-size 6 \
    --normalize 0.6 \
    --enc-depth 6 \
    --dec-depth 6 \
    --transformer-heads 16 \
    --transformer-dim-ffn 4096 \
    --transformer-ffn-activation relu \
    --lr-report \
    --optimizer-params 0.9 0.98 1e-09 \
    --clip-norm 0 \
    --sync-sgd \
    --exponential-smoothing \
    --relative-paths \
    --after-epochs 50 \
    --overwrite \
    --keep-best \
    --early-stopping 10 \
    --shuffle-in-ram "true" \
    --transformer-dropout 0.1 \
    # --transformer-heads 8 \
    # --transformer-postprocess-emb d \
    # --transformer-postprocess dan \
    # --label-smoothing 0.1 \
    # --learn-rate 0.0003 \
    # --lr-warmup 16000 \
    # --lr-decay-inv-sqrt 16000 \
    # --guided-alignment "${PATH_MTDATA}/${train_prefix}.${SRC_ISO1}_${TRG_ISO1}.par.alg" \
    # --valid-script-path ./scripts/validate.sh \
    # --pretrained-model $PATH_PRETRAINED_MODEL \