#!/bin/bash
set -x
source ./0_env.sh


PATH_TATOEBACHALLENGE="${PATH_DATA_PAIR}/tatoeba-challenge"

path_dev_src="${PATH_TATOEBACHALLENGE}/dev.${SRC_ISO1}-${TRG_ISO1}.${SRC_ISO1}.txt"
path_dev_trg="${PATH_TATOEBACHALLENGE}/dev.${SRC_ISO1}-${TRG_ISO1}.${TRG_ISO1}.txt"

path_dev_src_small="${path_dev_src}.10000"
path_dev_trg_small="${path_dev_trg}.10000"

cat $path_dev_src | head -n10000 > $path_dev_src_small
cat $path_dev_trg | head -n10000 > $path_dev_trg_small