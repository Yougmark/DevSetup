#!/bin/bash

os=`uname`
if [[ "$os" == 'Linux' ]]; then
    sudo apt-get install git tmux exuberant-ctags git-email neovim
elif [[ "$os" == 'Darwin' ]]; then
    brew install tmux neovim
fi
#sudo apt-get install vim libncurses5-dev gcc make git exuberant-ctags libssl-dev
currdir=$(pwd)

# tmux
cp $currdir/.tmux.conf ~/

# nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim/
cp $currdir/init.vim ~/.config/nvim/
vi +PluginInstall +qall