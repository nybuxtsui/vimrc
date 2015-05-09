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

apt-get install exuberant-ctags

cd ~/tmp
export GOPATH=$PWD
go get github.com/jstemmer/gotags
go get github.com/nsf/gocode
go get code.google.com/p/rog-go/exp/cmd/godef
cd bin
cp gocode gotags godef
