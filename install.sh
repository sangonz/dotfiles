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


# Install .gitconfig
# install .gitconfig "path = $dotfile_tilde/gitalias.txt" "[include]\n    path = $dotfile_tilde/gitalias.txt"

# Install vim
function install_ln {
    file="$1"
    dotfile=".$file"
    if [[ -e ~/$dotfile ]]; then
        printf "$P_ERR $file\n"
    else
        ln -s "$DOTFILES_DIR/$file" ~/$dotfile
        printf "$P_CHK $dotfile\n"
    fi
}

install_ln bashrc
install_ln vim
install_ln vimrc
install_ln gitconfig
