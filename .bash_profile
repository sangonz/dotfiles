#!/usr/bin/env bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ -d "$HOME/.dotfiles" ]; then
    export PATH="$HOME/.dotfiles/bin:$PATH"
else
    echo "Unable to find dotfiles!"
fi

# Alias

alias ..="cd .."
alias ...="cd .. && cd .."
alias ll='ls -alF'
alias cdd='cd ~/Desktop'
alias egrep='egrep -n --color=auto'
mkcd() { mkdir -p "$@" && cd "$@"; }

[ `which exa` ] && alias ls='exa --classify' && alias ll='exa -alF --git --classify'
[ `which bat` ] && alias cat='bat --style=plain'

[ `which ag` ] && alias agg='ag --hidden -iu'
[ `which ncdu` ] && alias ncdu="ncdu --color dark -r -x --exclude .git --exclude .meteor --exclude node_modules"

# Command - prints a horizontal line
alias -- -="printf '\033[33m%*s\033[0m\n' \"${COLUMNS:-$(tput cols)}\" '' | tr ' ' —"


# Variables

# Colored man with the pager most
[ `which most` ] && export PAGER='most'

export EDITOR='vim'
export CLICOLOR=1
export LSCOLORS=ExFxGxDxCxegedabagacad

## Prompt
if [ "$TERM" != 'dumb' ] && [ -n "$BASH" ] && [ -n "$PS1" ]; then
    RED='\[\033[01;31m\]'
    GREEN='\[\033[01;32m\]'
    YELLOW='\[\033[01;33m\]'
    BLUE='\[\033[01;34m\]'
    WHITE='\[\033[01;37m\]'
    RESET='\[\033[00m\]'
    export PS1="$GREEN\u$YELLOW@\h$BLUE \W \$ $RESET"
fi

