SRC_ISO3="isl"
TRG_ISO3="eng"

PATH_DATA="/home/wran/data/${SRC_ISO3}_${TRG_ISO3}/mtdata/train-parts"
PATH_CLEAN_SCRIPTS="/home/wran/TranslateLocally/clean/"

cd $PATH_CLEAN_SCRIPTS

for corpus_name in \
    "cc_aligned" \
    "EESC2017" \
    "ELRC_antibiotic" \
    "ELRC_bokmenntaborgin" \
    "ELRC_EMEA" \
    "ELRC_fme" \
    "ELRC_harpa" \
    "ELRC_listasafn" \
    "ELRC_lyfjastofnun" \
    "ELRC_nordisketax" \
    "ELRC_pfs" \
    "ELRC_statice" \
    "ELRC_utl" \
    "EMA2016" \
    "OPUS_bible_uedin_v1" \
    "OPUS_EUbookshop_v2" \
    "OPUS_GNOME_v1" \
    "OPUS_KDE4_v2" \
    "OPUS_OpenSubtitles_v2018" \
    "OPUS_QED_v2_0a" \
    "OPUS_TildeMODEL_v2018" \
    "OPUS_Ubuntu_v14_10" \
    "OPUS_wikimedia_v20190628" \
    "paracrawl_v8" \
    "rapid2016" \
    "WikiMatrix_v1" ; do

    echo "handling ${corpus_name} ..."
    bash ./clean-corpus.sh \
       "${PATH_DATA}/${corpus_name}-${SRC_ISO3}_${TRG_ISO3}" 
    
    echo "finished ${corpus_name} !"

  done