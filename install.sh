#!/bin/bash

# エラーで停止
set -e

# set PATH
DOTFILES=~/git/github.com/fenrirpride/dotfiles
MYREPOSITORY=~/git/github.com/fenrirpride

# Code
mkdir -p ~/.config/Code/User
ln -sfv $DOTFILES/Code/settings.json ~/.config/Code/User
ln -sfv $DOTFILES/Code/keybindings.json ~/.config/Code/User

# install dotfiles
mkdir -p ~/.config/xkeysnail
mkdir -p ~/.config/systemd/user
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
    echo "$HOME/$f"
    read -p "press to enter"
    ln -sfv "$DOTFILES/home/$f" "$HOME"
done

# make symbolic link at .config
cd $DOTFILES/.config
for f in *
do
    [ "$f" = ".git" ] && continue
    [ "$f" = "list" ] && continue
    [ "$f" = "autostart" ] && continue
    echo "$HOME/.config/$f"
    read -p "press to enter"
    ln -sfv "$DOTFILES/.config/$f" "$HOME/.config"
done

# make symbolic link at MyCode
ln -sfv "$MYREPOSITORY" "$HOME/MyCode"
# ln -sfv "/mnt/UbuntuData/UbuntuBackup/ansible_20" "$HOME/MyCode/ansible"

# for Jellyfin
#ln -sfv /mnt/DATA2/ANIME ~/docker/Jellyfin/media/
