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
    code --list-extensions > ~/MyCode/dotfiles/Code/extensions_list.txt
end
# view code extensions
function view_ex -d "view list vscode extensions"
    cat ~/MyCode/dotfiles/Code/extensions_list.txt
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
    rsync -avL --delete ~/MyCode/ansible /mnt/DATA2/Backup
    rsync -avL --delete ~/MyCode/dotfiles /mnt/DATA2/UbuntuBackup/Files
    rsync -avL --delete ~/.PyCharmCE2019.3 /mnt/DATA2/UbuntuBackup/Files
    rsync -avL --delete ~/.themes/ /mnt/DATA2/UbuntuBackup/Files/Themes
    rsync -avL --delete ~/.ssh /mnt/DATA2/UbuntuBackup/Files
    rsync -avL --delete ~/MyCode/wordpress /mnt/DATA2/UbuntuBackup
end
function view_fish -d "view fish settings"
    cat ~/.config/fish/config.fish
end
function edit_fish -d "edit fish settings"
    vim ~/.config/fish/config.fish
end
function view_functions -d "list functions"
     grep "^function" ./.config/fish/config.fish | awk -F'[ ]' -v 'ORS=\n' 'BEGIN {print "==Funcsions=="} {print $2,$4,$5,$6} END {print "=====END====="}'
end
status --is-login; and status --is-interactive; and exec byobu-launcher
