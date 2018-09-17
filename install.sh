#!/usr/bin/env bash
#
#
# Guide to manage dotfiles: https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789
set -e

P_CHK="\e[32m✓\e[0m"
P_ERR="\e[31m✗\e[0m"

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# Get the directory with a tilde instead of full path
dotfile_tilde=$(cd "$DOTFILES_DIR" && dirs +0)

# Install .bash_profile
if [[ -r ~/.bash_profile && `grep "$dotfile_tilde/.bash_profile" ~/.bash_profile` ]]; then
    printf "$P_ERR .bash_profile\n"
else
    echo ". $dotfile_tilde/.bash_profile" >> ~/.bash_profile
    printf "$P_CHK .bash_profile\n"
fi

# Install .gitconfig
if [[ -r ~/.gitconfig && `grep "path = $dotfile_tilde/gitalias.txt" ~/.gitconfig` ]]; then
    printf "$P_ERR .gitconfig\n"
else
    echo "[include]" >> ~/.gitconfig
    echo "    path = $dotfile_tilde/gitalias.txt" >> ~/.gitconfig
    printf "$P_CHK .gitconfig\n"
fi

# Install vim
ln -s $DOTFILES_DIR/.vim ~/.vim 
printf "$P_CHK .vim/\n"
ln -s $DOTFILES_DIR/.vimrc ~/.vimrc
printf "$P_CHK .vimrc\n"
