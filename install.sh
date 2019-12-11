#!/bin/bash
set -e

# ghq get
ghq get -p https://github.com/fenrirpride/Novel
ghq get -p https://github.com/fenrirpride/ansible
ghq get -p https://github.com/fenrirpride/dotfiles
ghq get -p https://github.com/fenrirpride/python

# make symbolic link MyCode
ln -s ~/git/github.com/fenrirpride/python ~/MyCode/python
ln -s ~/git/github.com/fenrirpride/ansible ~/MyCode/ansible
ln -s ~/git/github.com/fenrirpride/dotfiles ~/MyCode/dotfiles
ln -s ~/git/github.com/fenrirpride/Novel ~/MyCode/Novel

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
sudo rm -rf /etc/opt/xkeysnail
rm -rf ~/.byobu
rm -rf ~/.dein
rm -rf ~/.easystroke
rm -rf ~/.git
rm -rf ~/.gitkraken

# make symbolic link file
ln -s ~/MyCode/dotfiles/config.fish ~/.config/fish/config.fish
ln -s ~/MyCode/dotfiles/smplayer.ini ~/.config/smplayer/smplayer.ini
ln -s ~/MyCode/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/MyCode/dotfiles/.bashrc ~/.bashrc
ln -s ~/MyCode/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/MyCode/dotfiles/.imwheelrc ~/.imwheelrc
ln -s ~/MyCode/dotfiles/.vimrc ~/.vimrc
ln -s ~/MyCode/dotfiles/.xprofile ~/.xprofile

# make symbolic link directory
ln -s ~/MyCode/dotfiles/Code/User ~/.config/Code/User
ln -s ~/MyCode/dotfiles/albert ~/.config/albert
ln -s ~/MyCode/dotfiles/autokey ~/.config/autokey
ln -s ~/MyCode/dotfiles/autostart ~/.config/autostart
ln -s ~/MyCode/dotfiles/filezilla ~/.config/filezilla
sudo ln -s ~/MyCode/dotfiles/xkeysnail /etc/opt/xkeysnail
ln -s ~/MyCode/dotfiles/.byobu ~/.byobu
ln -s ~/MyCode/dotfiles/.dein ~/.dein
ln -s ~/MyCode/dotfiles/.easystroke ~/.easystroke
ln -s ~/MyCode/dotfiles/.git ~/.git
ln -s ~/MyCode/dotfiles/.gitkraken ~/.gitkraken

# keymap.txtについて
# imeの設定にてインポートする
