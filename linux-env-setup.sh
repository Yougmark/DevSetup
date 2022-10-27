#!/bin/bash

os=`uname`
echo $os
if [[ "$os" == 'Linux' ]]; then
    echo "installing..."
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    #sudo apt-get install git tmux exuberant-ctags git-email neovim curl
    #sudo apt-get install vim libncurses5-dev gcc make git exuberant-ctags libssl-dev
    sudo apt-get install git tmux exuberant-ctags neovim curl cscope wget yarn \
        nodejs tree fzf lsd bat fd-find
    curl -sL install-node.vercel.app/lts | sudo bash
elif [[ "$os" == 'Darwin' ]]; then
    brew install tmux neovim ctags curl fzf wget

    # To install useful key bindings and fuzzy completion:
    $(brew --prefix)/opt/fzf/install

    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
fi

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
# ln -Ffs $currdir/bashrc ~/.bashrc

echo "Installing nvim plugins ..."
nvim "+PlugInstall" "+qall"
echo "alias vi='nvim'" >> ~/.bashrc
echo "alias vim='nvim'" >> ~/.bashrc
echo "source /usr/share/doc/fzf/examples/key-bindings.bash" >> ~/.bashrc
echo "source /usr/share/doc/fzf/examples/completion.bash" >> ~/.bashrc
echo "set -o vi" >> ~/.bashrc
# echo "set editing-mode vi" >> ~/.bashrc
# echo "set keymap vi" >> ~/.bashrc

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
echo "export HISTSIZE=100000" >> ~/.bashrc
echo "export HISTFILESIZE=200000" >> ~/.bashrc
echo "Finished ..."

curl https://sh.rustup.rs -sSf | sh
. "$HOME/.cargo/env"
cargo install ripgrep
cargo install difftastic

