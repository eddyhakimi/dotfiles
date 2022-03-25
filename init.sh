#!/bin/bash

# link system dotfiles to dotfiles in this repository 
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}"  )" &> /dev/null && pwd  )
YCM_INSTALL_SCRIPT="$SCRIPT_DIR/.vim/pack/vendor/start/YouCompleteMe/install.py"

ln -s "$SCRIPT_DIR/.bashrc" ~/.bashrc
ln -s "$SCRIPT_DIR/.tmux.conf" ~/.tmux.conf
ln -s "$SCRIPT_DIR/.vim" ~/.vim
ln -s "$SCRIPT_DIR/.vimrc" ~/.vimrc

# install the vim plugins
git submodule update --init --recursive
python3 "$YCM_INSTALL_SCRIPT" --all

