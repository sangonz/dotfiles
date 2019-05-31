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

    # Make containing dirs
    mkdir -p `dirname $dest`

    if [[ ! -e $dest ]]; then
        # Create the link
        ln -s $target $dest
        printf "$P_NEW $dest\n"
    else
        if [[ $(readlink -e $dest) == $(readlink -e $file) ]]; then
            # Link already exists and is correct
            printf "$P_CHK $dest\n"
        else
            # Destination exists and does not link to dotfile's
            printf "$P_ERR $dest\n"
        fi
    fi
}

install_ln bashrc
install_ln bash_profile
install_ln vim
install_ln vimrc
install_ln gitconfig

for f in `find config -type f`; do
    install_ln $f
done
