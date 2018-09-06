#!/usr/bin/env bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

alias ..="cd .."
alias ...="cd .. && cd .."
alias ll='ls -alF'
alias cdd='cd ~/Desktop'
mkcd() { mkdir -p "$@" && cd "$@"; }
alias agg='ag --hidden -iu'


# alias ll='exa -alF --git'
# alias cat='bat --style=plain'
# alias agg='ag --hidden -iu'
# alias ncdu="ncdu --color dark -r -x --exclude .git --exclude .meteor --exclude node_modules"


# A complete ps with status([Z]ombie,[S]leep,[R]unning), pid, parent's pid, user, and command
alias psall='ps -eo state,pid,ppid,user,wchan:25,command'

alias egrep='egrep -n --color=auto'
SHELL=/bin/bash

#ls --color
export CLICOLOR=1
export LSCOLORS=ExFxGxDxCxegedabagacad

## Prompt
if [ "$TERM" != 'dumb' ] && [ -n "$BASH" ] && [ -n "$PS1" ]; then
	export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \W  ❯ \[\033[00m\]'
fi
