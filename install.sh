#!/bin/bash

# エラーで停止
set -e

# dein
ln -sf ~/MyCode/dotfiles/dein/dein.toml ~/.vim/dein
ln -sf ~/MyCode/dotfiles/dein/dein-lazy.toml ~/.vim/dein

# Code
ln -sf ~/MyCode/dotfiles/Code/settings.json ~/.config/Code/User
ln -sf ~/MyCode/dotfiles/Code/keybindings.json ~/.config/Code/User

# install dotfiles
sudo ln -sf ~/MyCode/dotfiles/xkeysnail /etc/opt/xkeysnail

# set PATH
DOTFILES=~/MyCode/dotfiles

# make symbolic link at home
cd $DOTFILES/.config
for f in *
do
    [ "$f" = ".git" ] && continue
    ln -sfv "$DOTFILES"/.config/"$f" "$HOME"/.config/"$f"
    # echo $f
done

# make symbolic link at .config
cd $DOTFILES/home
for f in .??*
do
    [ "$f" = ".git" ] && continue
    ln -sfv "$DOTFILES"/home/"$f" "$HOME"/"$f"
    # echo $f
done
