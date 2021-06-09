#!/bin/bash
##
# Basic cleaning of parallel corpora.
#
# Usage:
#   bash clean-corpus.sh prefix [prefix...]
#

set -x

TOOLS=./tools

declare -A ISO3_TO_1




ISO3_TO_1[${SRC_ISO3}]=$SRC_ISO1
ISO3_TO_1[${TRG_ISO3}]=$TRG_ISO1

for data in $@; do
    # Check if files exist
    test -s $data.${SRC_ISO3} || exit 1
    test -s $data.${TRG_ISO3} || exit 1
    echo SRC
    ######################################################################
    # Basic preprocessing
    for LNG_ISO3 in ${SRC_ISO3} ${TRG_ISO3}; do
        LNG_ISO1=${ISO3_TO_1[$LNG_ISO3]}
        echo $LNG_ISO1
        cat $data.$LNG_ISO3 \
            | parallel --no-notice --pipe -k -j16 --block 50M "perl $TOOLS/remove-non-printing-char.perl | perl $TOOLS/normalize-punctuation.perl -l $LNG_ISO1" \
            | pigz > $data.$LNG_ISO3.nrm.gz
    done
    test -s $data.${SRC_ISO3}.nrm.gz || exit 1
    test -s $data.${TRG_ISO3}.nrm.gz || exit 1

    ######################################################################
    # Deduplication
    paste <(pigz -dc $data.${SRC_ISO3}.nrm.gz) <(pigz -dc $data.${TRG_ISO3}.nrm.gz) \
        | LC_ALL=C sort -S 10G | uniq \
        | pigz > $data.${SRC_ISO3}_${TRG_ISO3}.nrm.uniq.gz

    test -s $data.${SRC_ISO3}_${TRG_ISO3}.nrm.uniq.gz || exit 1

    ######################################################################
    # Rule-based filtering
    pigz -dc $data.${SRC_ISO3}_${TRG_ISO3}.nrm.uniq.gz \
        | parallel --no-notice --pipe -k -j16 --block 50M "python3.7 $TOOLS/clean-parallel.py -l1 ${SRC_ISO1} -l2 ${TRG_ISO1} --debug" \
        2> $data.${SRC_ISO3}_${TRG_ISO3}.clean.debug.txt \
        | pigz > $data.${SRC_ISO3}_${TRG_ISO3}.rule-based.gz

    test -s $data.${SRC_ISO3}_${TRG_ISO3}.rule-based.gz || exit 1

    ######################################################################
    # Language identification
    pigz -dc $data.${SRC_ISO3}_${TRG_ISO3}.rule-based.gz \
        | parallel --no-notice --pipe -k -j16 --block 50M "python3.7 -Wi $TOOLS/langid-fasttext.py -f 1 | python3.7 -Wi $TOOLS/langid-fasttext.py -f 1" \
        | grep -P "^${SRC_ISO1}\t${TRG_ISO1}\t" \
        | cut -f3,4 \
        | pigz > $data.${SRC_ISO3}_${TRG_ISO3}.langid.gz

    test -s $data.${SRC_ISO3}_${TRG_ISO3}.langid.gz

    ######################################################################
    # Generate clean data in source and target languages
    # Remove leading and repetitive white spaces
    pigz -dc $data.${SRC_ISO3}_${TRG_ISO3}.langid.gz | cut -f1 | sed -e 's/^[[:space:]]*//' | tr -s " " \
        | pigz > $data.${SRC_ISO3}.clean.gz
    pigz -dc $data.${SRC_ISO3}_${TRG_ISO3}.langid.gz | cut -f2 | sed -e 's/^[[:space:]]*//' | tr -s " " \
        | pigz > $data.${TRG_ISO3}.clean.gz

    test -s $data.${SRC_ISO3}.clean.gz || exit 1
    test -s $data.${TRG_ISO3}.clean.gz || exit 1

    #pigz -dc $data.${SRC_ISO3}.clean.gz > $data.${SRC_ISO3}.clean
    #pigz -dc $data.${TRG_ISO3}.clean.gz > $data.${TRG_ISO3}.clean

    # Remove $data from intermediate steps
    #rm -f *.nrm.gz *.nrm.uniq.gz *.langid.gz
    #wc -l *.debug.txt

done
