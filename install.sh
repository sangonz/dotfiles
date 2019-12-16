#!/usr/bin/env bash
#
# Guide to manage dotfiles: https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789
#
set -e

P_CHK="\e[32m  ✔ \e[0m"
P_NEW="\e[32m★ ✔ \e[0m"
P_ERR="\e[31m  ✘ \e[0m"

link_dest() {
    case "$(uname)" in
    	"Linux")
            readlink $1
            ;;
        "Darwin" | "FreeBSD")
            stat -f '%Y' $1
            ;;
        *)
            echo "Only Linux and macOS supported" > /dev/stderr
            exit -1
            ;;
    esac
}

function install_ln {
    file="$1"
    target=".dotfiles/$file"
    dest="$HOME/.$file"
    # -e does not work with links; we must test -e and -h
    if [[ ! ( -e $dest || -h $dest ) ]]; then
        ln -s $target $dest
        printf "$P_NEW $dest\n"
    else
        if [[ $(link_dest $dest) == "$target" ]]; then
            printf "$P_CHK $dest\n"
        else
            printf "$P_ERR $dest\n"
        fi
    fi
}

install_ln bash_aliases
install_ln bash_profile
install_ln vim
install_ln vimrc
install_ln gitconfig
install_ln zshrc

