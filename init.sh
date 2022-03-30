#!/bin/bash

# link system dotfiles to dotfiles in this repository 
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}"  )" &> /dev/null && pwd  )

ln -s "$SCRIPT_DIR/.bashrc" ~/.bashrc
ln -s "$SCRIPT_DIR/.tmux.conf" ~/.tmux.conf
ln -s "$SCRIPT_DIR/.vim" ~/.vim
ln -s "$SCRIPT_DIR/.vimrc" ~/.vimrc

# install vim plugins
git submodule update --init --recursive

# Install coc extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json  ]
then
  echo '{"dependencies":{}}'> package.json
fi
npm install coc-tsserver coc-json coc-html coc-css coc-pyright --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
