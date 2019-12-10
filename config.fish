# path for linuxbrew
set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin" $fish_user_paths
# ghq
set GHQ_SELECTOR peco
set -U FZF_LEGACY_KEYBINDINGS 0
# set PATH
set -x PATH ~/go/bin $PATH
# functions
function update -d "update all packages"
    sudo apt update
    sudo apt -y upgrade
    sudo apt -y full-upgrade
    sudo apt -y autoclean
    sudo apt -y autoremove
    flatpak update -y
    sudo snap refresh
    brew update
    brew upgrade
end
# output code extensions
function code_out -d "make list vscode extensions"
    code --list-extensions > ~/dotfiles/Code/extensions_list.txt
end
# view code extensions
function view_ex -d "make list vscode extensions"
    cat ~/dotfiles/Code/extensions_list.txt
end
# narou
function narouu -d "narou update"
    cd /mnt/DATA1/Novel
    narou u
    cd
end
function naroud -d "narou download"
    cd /mnt/DATA1/Novel
    narou d $argv
    cd
end
function epub -d "epub upload dropbox"
    find /mnt/DATA1/Novel/ -name \*.epub | while read line
    cp -u "$line" /mnt/DATA1/online/Dropbox/epub > /dev/null
    end
end
# backup
function backup -d "backup"
    rsync -av --delete ~/ansible /mnt/DATA2/UbuntuBackup
    rsync -av --delete ~/dotfiles /mnt/DATA2/UbuntuBackup/Files
end
status --is-login; and status --is-interactive; and exec byobu-launcher
