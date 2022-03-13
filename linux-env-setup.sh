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
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim/
ln -Ffs $currdir/init.vim ~/.config/nvim/init.vim
ln -Ffs $currdir/coc.vim ~/.config/nvim/coc.vim
ln -Ffs $currdir/nvim-tree.vim ~/.config/nvim/nvim-tree.vim
ln -Ffs $currdir/coc-settings.json ~/.config/nvim/coc-settings.json

echo "Installing nvim plugins ..."
nvim "+PlugInstall" "+qall"
echo "alias vi='nvim'" >> ~/.bashrc
echo "alias vim='nvim'" >> ~/.bashrc
echo "Finished ..."
