# Usually I create venv to be sure to not corrupt the global python ...
# ... but let's just do it like this at the moment

# install python 3.7
sudo apt-get install python3.7-minimal python3.7-dev

# update core packages
python3.7 -m pip install --upgrade pip wheel setuptools

# install sacrebleu
python3.7 -m pip install sacrebleu 

# install fasttext
python3.7 -m pip install fasttext 

# other dependencies
python3.7 -m pip install lxml # for extracting xml (as in wmt21)

# install mtdata
cd ~ 
git clone https://github.com/thammegowda/mtdata
cd mtdata
python3.7 -m pip install --editable .