#!/bin/bash

# エラーで停止
set -e

# set PATH
DOTFILES=~/git/github.com/fenrirpride/dotfiles
MYREPOSITORY=~/git/github.com/fenrirpride

# make symbolic link at MyCode
ln -sfv "$MYREPOSITORY" "$HOME/MyCode"
