# ~/.bashrc: executed by bash(1) for non-login shells.

# add dotfiles bin directory to path env variable
PATH="$PATH:~/dotfiles/bin"

# fancier prompt
PS1='\[\e[1;32m\][\[\e[1;36m\]\u@\h\[\e[m\]\[\e[1;32m\] \w ]\$ \[\e[m\]' 

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# aliases for common used commands
alias grep='grep --color=auto'
alias up='cd ..'
alias ls='ls --color=auto'
alias ll='ls -lah'
alias v='vim'
alias cb='xclip -selection clipboard'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gl='git log'
alias gla='git log --graph --oneline --all'
alias gf='git fetch'
alias gps='git push'
alias gpl='git pull'

# set the keybindings to vi mode
set -o vi
