#!/bin/bash
set -e
# remove file
rm ~/.config/fish/config.fish
rm ~/.config/smplayer/smplayer.ini
rm ~/.bash_profile
rm ~/.bashrc
rm ~/.gitconfig
rm ~/.imwheelrc
rm ~/.vimrc
rm ~/.xprofile

# remove directory
rm -rf ~/.config/Code/User
rm -rf ~/.config/albert
rm -rf ~/.config/autokey
rm -rf ~/.config/autostart
rm -rf ~/.config/filezilla
rm -rf /etc/opt/xkeysnail
rm -rf ~/.byobu
rm -rf ~/.dein
rm -rf ~/.easystroke
rm -rf ~/.git
rm -rf ~/.gitkraken

# make symbolic link file
ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/smplayer.ini ~/.config/smplayer/smplayer.ini
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.imwheelrc ~/.imwheelrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.xprofile ~/.xprofile

# make symbolic link directory
ln -s ~/dotfiles/Code/User ~/.config/Code/User
ln -s ~/dotfiles/albert ~/.config/albert
ln -s ~/dotfiles/autokey ~/.config/autokey
ln -s ~/dotfiles/autostart ~/.config/autostart
ln -s ~/dotfiles/filezilla ~/.config/filezilla
ln -s ~/dotfiles/xkeysnail /etc/opt/xkeysnail
ln -s ~/dotfiles/.byobu ~/.byobu
ln -s ~/dotfiles/.dein ~/.dein
ln -s ~/dotfiles/.easystroke ~/.easystroke
ln -s ~/dotfiles/.git ~/.git
ln -s ~/dotfiles/.gitkraken ~/.gitkraken

# keymap.txtについて
# imeの設定にてインポートする

# make symbolic link MyCode
ln -s ~/git/github.com/fenrirpride/python ~/MyCode/python
ln -s ~/git/github.com/fenrirpride/ansible ~/MyCode/ansible
ln -s ~/git/github.com/fenrirpride/dotfiles ~/MyCode/dotfiles
ln -s ~/git/github.com/fenrirpride/Novel ~/MyCode/Novel
