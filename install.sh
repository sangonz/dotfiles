#!/usr/bin/env bash
#
#
# Guide to manage dotfiles: https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789


export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# Get the directory with a tilde instead of full path
dotfile_tilde=$(cd "$DOTFILES_DIR" && dirs +0)

if [[ `grep "$dotfile_tilde/.bash_profile" ~/.bash_profile` ]]; then
    echo ".bash_profile already installed"
else
    echo "Installing in current .bash_profile"
    echo ". $dotfile_tilde/.bash_profile" >> ~/.bash_profile
fi

if [[ `grep "path = $dotfile_tilde/gitalias.txt" ~/.gitconfig` ]]; then
    echo "~/.gitconfig already contains the alias"
else
    echo "Installing .gitconfig alias"
    echo "[include]" >> ~/.gitconfig
    echo "    path = $dotfile_tilde/gitalias.txt" >> ~/.gitconfig
fi
