#!/bin/sh

cp _vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +":BundleInstall" +":q"
cp ~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py ~/.vim/bundle/YouCompleteMe/cpp/ycm/_ycm_extra_conf.py.bak
cp _ycm_extra_conf.py ~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py

cd ~/.vim/bundle/YouCompleteMe
sudo apt-get install build-essential cmake python-dev 
./install.sh --clang-completer

go get -u github.com/nsf/gocode
cp bin/gocode ~/bin
