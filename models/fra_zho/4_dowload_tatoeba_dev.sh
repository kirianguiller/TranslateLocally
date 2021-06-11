#!/bin/bash
set -x
source ./0_env.sh


PATH_TATOEBACHALLENGE="${PATH_DATA_PAIR}/tatoeba-challenge"

mkdir -p ${PATH_TATOEBACHALLENGE}
cd "${PATH_TATOEBACHALLENGE}"
 
wget "https://raw.githubusercontent.com/Helsinki-NLP/Tatoeba-Challenge/master/data/dev/${SRC_ISO3}-${TRG_ISO3}/dev.txt"
wget "https://raw.githubusercontent.com/Helsinki-NLP/Tatoeba-Challenge/master/data/test/${SRC_ISO3}-${TRG_ISO3}/test.txt"