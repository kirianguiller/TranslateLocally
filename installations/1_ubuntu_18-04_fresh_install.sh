set -e

# install tons of stuff
apt-get update
apt-get install -y --no-install-recommends doxygen g++-8 ca-certificates git wget gnupg build-essential lsb-release g++-8 automake autogen libtool cmake-data cmake unzip libboost-all-dev libblas-dev libopenblas-dev libz-dev libssl-dev protobuf-compiler libprotobuf-dev

# add for filtering scripts
apt-get install -y --no-install-recommends parallel 
apt-get install -y --no-install-recommends pigz 

# update g++
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 8

# update CMAKE (https://stackoverflow.com/questions/49859457/how-to-reinstall-the-latest-cmake-version)
sudo apt-get update
sudo apt-get install -y --no-install-recommends apt-transport-https ca-certificates gnupg \
                         software-properties-common wget
wget -qO - https://apt.kitware.com/keys/kitware-archive-latest.asc |     sudo apt-key add -
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
sudo apt-get update
sudo apt-get install -y --no-install-recommends cmake

# install cuda 11-1
cd ~
mkdir install ; cd install
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo add-apt-repository "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/ /"
sudo apt-get -y update
sudo apt-get -y install cuda-11-1

# Downloads and compiles Marian
# See https://marian-nmt.github.io/docs/#installation for requirements

cd ~

git clone https://github.com/marian-nmt/marian-dev
mkdir -p marian-dev/build
cd marian-dev/build
sudo cmake .. -DUSE_SENTENCEPIECE=on -DCOMPILE_CPU=on -DUSE_FBGEMM=on
sudo make -j 10

# install preprocess from KPU (https://github.com/kpu/preprocess)
cd ~
git clone https://github.com/kpu/preprocess
cd preprocess
mkdir build
cd build
cmake ..
sudo make -j4



