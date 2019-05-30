#!/usr/bin/env bash
#
# Guide to manage dotfiles: https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789
#
set -e

P_CHK="\e[32m  ✔ \e[0m"
P_NEW="\e[32m★ ✔ \e[0m"
P_ERR="\e[31m  ✘ \e[0m"

function install_ln {
    file="$1"
    target=".dotfiles/$file"
    dest="$HOME/.$file"
    if [[ ! -e $dest ]]; then
        ln -s $target $dest
        printf "$P_NEW $dest\n"
    else
        if [[ $(readlink -e $dest) == $(readlink -e $file) ]]; then
            printf "$P_CHK $dest\n"
        else
            printf "$P_ERR $dest\n"
        fi
    fi
}

install_ln bashrc
install_ln bash_profile
install_ln vim
install_ln vimrc
install_ln gitconfig

