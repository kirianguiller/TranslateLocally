# Usually I create venv to be sure to not corrupt the global python ...
# ... but let's just do it like this at the moment
# install pip 3.6
sudo apt install python3-pip

# install python 3.7
sudo apt-get install -y --no-install-recommends python3.7-minimal python3.7-dev python3.7 python3.7-venv
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