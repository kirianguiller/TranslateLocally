# Prototyping : Pipeline on isl_eng baseline model

Here you can find all that is necessary for fetching data, (basic) cleaning and training with marian.

/!\ At the moment, you need to be careful about 2 things :
- all path are hard coded, just change them to fits your needs
- please first install basic dependencies (marian, preprocess, cuda, etc...) and python global dependencies (lxml, fasttext, etc) from the two installations scripts present in `installations/` folder. 

If you are on ubuntu 18.04 and have access to a cuda 11.1 compatible GPU, you should be able to reproduce what we have here :)