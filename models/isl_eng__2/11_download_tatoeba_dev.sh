
PATH_DATA_ROOT="/home/wran/data/isl_eng/tatoeba-challenge"
mkdir ${PATH_DATA_ROOT}
cd "${PATH_DATA_ROOT}"
 
wget https://raw.githubusercontent.com/Helsinki-NLP/Tatoeba-Challenge/master/data/dev/eng-isl/dev.txt
wget https://raw.githubusercontent.com/Helsinki-NLP/Tatoeba-Challenge/master/data/test/eng-isl/test.txt