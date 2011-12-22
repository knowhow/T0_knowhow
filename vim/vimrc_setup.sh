#!/bin/bash
# ver 0.1.1
# bjasko@bring.out.ba 
# 22.12.2011
# vim setup

# req
sudo apt-get install curl perl vim vim-gtk git-core wget

# install
mkdir vimrc_tmp
cd vimrc_tmp
git clone https://github.com/hernad/dotVim 
cd dotVim 
./git_update.sh 
cp -a  * ~/.vim 
cd ..
wget https://github.com/knowhow/T0_knowhow/raw/master/vim/_vimrc
wget https://github.com/knowhow/T0_knowhow/raw/master/vim/_gvimrc
cp -v --backup  _gvimrc ~/.gvimrc | cp -v --backup  _vimrc ~/.vimrc 
cd ..
rm -rf vimrc_tmp
exit
