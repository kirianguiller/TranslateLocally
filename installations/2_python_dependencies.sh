# Usually I create venv to be sure to not corrupt the global python ...
# ... but let's just do it like this at the moment

# install python 3.7
sudo apt-get install python3.7-minimal python3.7-dev

# update core packages
python3.7 -m pip install --upgrade pip wheel setuptools


python3.7 -m venv venv

source venv/bin/activate

pip install --upgrade pip wheel setuptools

# install sacrebleu
# pip install sacrebleu 

# install fasttext
pip install fasttext 

# other dependencies
pip install lxml # for extracting xml (as in wmt21)

# install mtdata
cd ~ 
git clone https://github.com/thammegowda/mtdata
cd mtdata
pip install --editable .

cd ~
git clone https://github.com/Tortlang/sacrebleu
cd sacrebleu
pip install .