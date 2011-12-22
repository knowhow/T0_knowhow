#!/bin/bash
# ver 0.1.0
# bjasko@bring.out.ba 
# 22.12.2011
# vim setup

# req
sudo apt-get install curl perl vim vim-gtk git-core wget

# install 
git clone https://github.com/hernad/dotVim |  cd dotVim 
./git_update.sh 
cp -a  * ~/.vim 
cd ..
wget https://github.com/knowhow/T0_knowhow/raw/master/vim/_vimrc
wget https://github.com/knowhow/T0_knowhow/raw/master/vim/_gvimrc
cp -v _gvimrc ~/.gvimrc | cp -v _vimrc ~/.vimrc 
exit
