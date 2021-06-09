# Prototyping : Pipeline on eng_tur baseline model

Here you can find all that is necessary for fetching data, (basic) cleaning and training with marian.

/!\ At the moment, you need to be careful about 2 things :
- all path are hard coded, just change them to fits your needs. They are all supposed to be in `0_env.sh` and `0b_env.json`.
- please first install basic dependencies (marian, preprocess, cuda, etc...) and python global dependencies (lxml, fasttext, etc) from the two installations scripts present in `installations/` folder. 

If you are on ubuntu 18.04 and have access to a cuda 11.1 compatible GPU, you should be able to reproduce what we have here :)

## Information about the training
- Number of lines after cleaning : ~ ???
- Number of lines after deduplication : ~ 33M
- GPU : 2 (3090)