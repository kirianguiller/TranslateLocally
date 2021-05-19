# install python 3.7
sudo apt install python3.7-minimal

# update core packages
python3.7 -m pip install --upgrade pip wheel setuptools

# install sacrebleu
python3.7 -m pip install sacrebleu --user


# install mtdata
cd ~ 
git clone https://github.com/thammegowda/mtdata
cd mtdata
python3.7 -m pip install --editable .