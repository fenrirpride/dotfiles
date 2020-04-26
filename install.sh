#!/bin/bash

# エラーで停止
set -e

# set PATH
DOTFILES=~/git/github.com/fenrirpride/dotfiles
MYREPOSITORY=~/git/github.com/fenrirpride

# dein
ln -sfv $DOTFILES/dein/dein.toml ~/.vim/dein
ln -sfv $DOTFILES/dein/dein-lazy.toml ~/.vim/dein

# Code
ln -sfv $DOTFILES/Code/settings.json ~/.config/Code/User
ln -sfv $DOTFILES/Code/keybindings.json ~/.config/Code/User

# install dotfiles
mkdir -p ~/.config/xkeysnail
ln -sfv $DOTFILES/xkeysnail/xkeysnail.service ~/.config/systemd/user
ln -sfv $DOTFILES/xkeysnail/config.py ~/.config/xkeysnail
systemctl --user enable xkeysnail
systemctl --user start xkeysnail.service

# remove directory
rm -rf ~/.config/autostart
rm -rf ~/.config/fish

# make symbolic link at home
cd $DOTFILES/home
for f in .??*
do
    ln -sfv "$DOTFILES/home/$f" "$HOME"
    # echo $f
done

# make symbolic link at .config
cd $DOTFILES/.config
for f in *
do
    [ "$f" = ".git" ] && continue
    [ "$f" = "list" ] && continue
    ln -sfv "$DOTFILES/.config/$f" "$HOME/.config"
    # echo $f
done

# make symbolic link at MyCode
ln -sfv "$MYREPOSITORY" "$HOME/MyCode"
