#!/bin/bash

os=`uname`
echo $os
if [[ "$os" == 'Linux' ]]; then
    echo "installing..."
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    #sudo apt-get install git tmux exuberant-ctags git-email neovim curl
    sudo apt-get install git tmux exuberant-ctags neovim curl cscope
elif [[ "$os" == 'Darwin' ]]; then
    brew install tmux neovim ctags curl
fi
#sudo apt-get install vim libncurses5-dev gcc make git exuberant-ctags libssl-dev

currdir=$(pwd)

# tmux
ln -Ffs $currdir/.tmux.conf ~/.tmux.conf

# nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim/
ln -Ffs $currdir/init.vim ~/.config/nvim/init.vim
echo "Installing nvim plugins ..."
nvim "+PlugInstall" "+qall"
echo "Finished ..."
