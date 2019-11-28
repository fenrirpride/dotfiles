# path for linuxbrew
set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin" $fish_user_paths
# ghq
set GHQ_SELECTOR peco
set -U FZF_LEGACY_KEYBINDINGS 0
# functions
function update -d "update all packages"
    sudo apt update
    sudo apt -y upgrade
    sudo apt -y full-upgrade
    sudo apt -y autoclean
    sudo apt -y autoremove
    flatpak update
    snap refresh
    brew update
    brew upgrade
end
# output code extensions
function code_out -d "make list vscode extensions"
    code --list-extensions > ~/dotfiles/Code/extensions_list.txt
end
# narou
function narouu -d "narou update"
    cd /mnt/DATA1/Novel
    narou u
end
function naroud -d "narou download"
    cd /mnt/DATA1/Novel
    narou d $argv
end
