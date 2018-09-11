#!/usr/bin/env bash
#
#
# Guide to manage dotfiles: https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789


export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# Get the directory with a tilde instead of full path
dotfile_tilde=$(cd "$DOTFILES_DIR" && dirs +0)

if [[ `grep "$dotfile_tilde/.bash_profile" ~/.bash_profile` ]]; then
    echo "Already installed in .bash_profile"
else
    echo "Installing in current .bash_profile"
    echo ". $dotfile_tilde/.bash_profile" >> ~/.bash_profile
fi
