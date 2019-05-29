#!/usr/bin/env bash
sudo apt-get install -y git bzip2 unzip build-essential tmux

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -P /tmp
bash /tmp/Miniconda3-latest-Linux-x86_64.sh
conda create -n despi python=3.6

conda activate despi
conda install faiss-cpu pytorch -c pytorch
conda install -c cyclus java-jdk
pip install -r requirements.txt
pip install -r open/requirements.txt

# DrQA stuff
git clone https://github.com/facebookresearch/DrQA.git
cd DrQA; pip install -r requirements.txt; python setup.py develop
./install_corenlp.sh
export CLASSPATH=$CLASSPATH:data/corenlp/*
cd ..


# make 1B_serve
# cd open; make 1B_demo
