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
sudo ln -sfv $DOTFILES/xkeysnail /etc/opt/xkeysnail

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
    ln -sfv "$DOTFILES/.config/$f" "$HOME/.config"
    # echo $f
done

# make symbolic link at MyCode
cd $MYREPOSITORY
for f in *
do
    ln -sfv "$MYREPOSITORY/$f" "$HOME/MyCode"
    # echo $f
done

#ln -sfv "$HOME/pCloudDrive/wordpress" "$HOME/MyCode"
