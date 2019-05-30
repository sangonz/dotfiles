#!/usr/bin/env bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

shopt -s autocd # Just type a directory to cd
HISTSIZE=10000
HISTFILESIZE=10000

export EDITOR='nvim'

# Alias

alias ..="cd .."
alias ...="cd .. && cd .."
alias cdd='cd ~/Desktop'
alias v='nvim'
alias g='git'
alias p='sudo pacman'
alias r='ranger'
alias SS='sudo systemctl'

# Commonly edited files
alias vbashrc='$EDITOR ~/.dotfiles/bashrc'
alias vvimrc='$EDITOR ~/.dotfiles/vimrc'

mkcd() { mkdir -p "$@" && cd "$@"; }

[ `which exa 2> /dev/null` ] && alias ls='exa --classify' && alias ll='exa -alF --git --classify'
[ `which ag 2> /dev/null` ] && alias agg='ag --hidden -iu'
alias ncdu="ncdu --color dark -r -x --exclude .git --exclude .meteor --exclude node_modules"

# fzf
export FZF_DEFAULT_OPTS="--preview '_bat_fzf_fix {}'"
[ /usr/share/fzf/completion.bash ] && . /usr/share/fzf/completion.bash
[ /usr/share/fzf/key-bindings.bash ] && . /usr/share/fzf/key-bindings.bash

# Colors
alias ll='ls -alF'
alias egrep='egrep -n --color=auto'
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

export PATH="~/.dotfiles/bin:$PATH"

