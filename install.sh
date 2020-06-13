#!/bin/bash

# エラーで停止
set -e

# set PATH
DOTFILES=~/git/github.com/fenrirpride/dotfiles
MYREPOSITORY=~/git/github.com/fenrirpride

# Code
cd $DOTFILES/Code
mkdir -p ~/.config/Code/User
for f in *
do
    [ "$f" = "extensions_list.txt" ] && continue
    rm -rf ~/.config/Code/User/$f
    ln -sfv $DOTFILES/Code/$f ~/.config/Code/User/$f
done

# install dotfiles
mkdir -p ~/.config/xkeysnail
mkdir -p ~/.config/systemd/user
ln -sfv $DOTFILES/xkeysnail/xkeysnail.service ~/.config/systemd/user/xkeysnail.service
ln -sfv $DOTFILES/xkeysnail/config.py ~/.config/xkeysnail/config.py
systemctl --user enable xkeysnail
systemctl --user start xkeysnail.service

# make symbolic link at home
cd $DOTFILES/home
for f in .??*
do
    rm -rf "$HOME/$f"
    ln -sfv "$DOTFILES/home/$f" "$HOME"
done

# make symbolic link at .config
cd $DOTFILES/.config
for f in *
do
    [ "$f" = "list" ] && continue
    [ "$f" = "pulse" ] && continue
    rm -rf "$HOME/.config/$f"
    ln -sfv "$DOTFILES/.config/$f" "$HOME/.config"
done
cp -a $DOTFILES/.config/pulse "$HOME/.config"

# make symbolic link at MyCode
ln -sfv "$MYREPOSITORY" "$HOME/MyCode"
