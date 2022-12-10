#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}"  )" &> /dev/null && pwd  )

# Move existing dotfiles into temporary directory
mkdir -p tmp
handle_existing_dotfile () {
  if [ -f "$1" -a ! -h "$1" ]; then
      echo "$1 already exists. Moving $1 to $SCRIPT_DIR/tmp"
      mv $1 $SCRIPT_DIR/tmp/
  fi
}

FILE=~/.bashrc
handle_existing_dotfile $FILE
FILE=~/.tmux.conf
handle_existing_dotfile $FILE
FILE=~/.vim
handle_existing_dotfile $FILE
FILE=~/.vimrc
handle_existing_dotfile $FILE

# link system dotfiles to dotfiles in this repository 
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