#!/usr/bin/env bash
#
#
# Guide to manage dotfiles: https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789
set -e

P_CHK="\e[32m[ok]\e[0m"
P_ERR="\e[31m[no]\e[0m"

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# Get the directory with a tilde instead of full path
dotfile_tilde=$(cd "$DOTFILES_DIR" && dirs +0)

function install {
    file="$1"
    search="$2"
    toadd="$3"
    [[ -z $toadd ]] && toadd="$search"
    
    # Caution: ~ doesn't expand within quotes
    if [[ -r ~/$file && `grep "$search" ~/$file` ]]; then
        printf "$P_ERR $file\n"
    else
        printf "$toadd" >> ~/$file
        printf "$P_CHK $file\n"
    fi
}


# Install .bashrc or .bash_profile alternatively
if [ -r ~/.bashrc ]; then
    install .bashrc ". $dotfile_tilde/.bash_profile"
else
    install .bash_profile ". $dotfile_tilde/.bash_profile"
fi


# Install .gitconfig
install .gitconfig "path = $dotfile_tilde/gitalias.txt" "[include]\n    path = $dotfile_tilde/gitalias.txt"

# Install vim
function install_ln {
    file="$1"
    if [[ -r ~/$file ]]; then
        printf "$P_ERR $file\n"
    else
        ln -s "$DOTFILES_DIR/$file" ~/$file
        printf "$P_CHK $file\n"
    fi
}

install_ln .vim
install_ln .vimrc
