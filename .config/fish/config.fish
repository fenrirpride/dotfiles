# PATH settings
# for linuxbrew
set -x PATH "/home/linuxbrew/.linuxbrew/bin" $PATH
set -x PATH "/home/linuxbrew/.linuxbrew/sbin" $PATH
# for anyenv
set -x PATH "$HOME/.anyenv/bin" $PATH
# path for rbenv from anyenv
set -x RBENV_ROOT "/home/yukio/.anyenv/envs/rbenv"
set -x PATH "/home/yukio/.anyenv/envs/rbenv/bin" $PATH
set -x PATH "/home/yukio/.anyenv/envs/rbenv/shims" $PATH
set -x PATH "$HOME/.anyenv/envs/rbenv/versions/2.6.6/bin" $PATH

set -x RBENV_SHELL fish

# for ghq
set GHQ_SELECTOR peco
set -U FZF_LEGACY_KEYBINDINGS 0

# for go
set -x PATH ~/go/bin $PATH

# functions

# system
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
    brew cleanup
    fish_update_completions
end

# vscode
function code_out -d "make list vscode extensions"
    code --list-extensions > ~/MyCode/dotfiles/Code/extensions_list.txt
end

function code_in -d "install vscode extensions"
    while read line
    code --install-extension $line
    end < ~/MyCode/dotfiles/Code/extensions_list.txt
end

# fish
function view_ex -d "view list vscode extensions"
    cat ~/MyCode/dotfiles/Code/extensions_list.txt
end

# pycharm
function py_out -d "make list of pycharm plugins"
    ls -d -1 ~/.local/share/JetBrains/PyCharm*/*/ | awk '{ print $8 }' FS='/' > ~/MyCode/dotfiles/pycharm/extensions_list.txt
    ls -1 ~/.local/share/JetBrains/PyCharm*/ | grep jar | sed -e 's/.jar//g' >> ~/MyCode/dotfiles/pycharm/extensions_list.txt
end

# narou
function narouu -d "narou update"
    cd /mnt/DATA1/Novel
    bundle exec narou u
    cd
end

function naroud -d "narou download"
    cd /mnt/DATA1/Novel
    bundle exec narou d $argv
    cd
end

function epub -d "epub upload dropbox"
    if test -e /mnt/RAMDISK/narou_update
        rm /mnt/RAMDISK/narou_update
    end
    find "/mnt/DATA1/Novel/小説データ" -name \*.epub | while read line
    cp -vu "$line" /mnt/DATA1/online/Dropbox/epub | awk -F'[\''/']' -v 'ORS=\n' '{print $9}' >> /mnt/RAMDISK/narou_update
    end
    while read line
    cp "/mnt/DATA1/online/Dropbox/epub/$line" "/mnt/DATA1/online/Dropbox/epub/update"
    end < /mnt/RAMDISK/narou_update
    sudo rsync -avhl --delete --modify-window=1 "/mnt/DATA1/online/Dropbox/epub/" ~/Dropbox/epub
end

# backup
function backup -d "backup"
    echo -e "\e[32m"ansible"\e[m"
    rsync -avhl --delete --exclude '.git' --modify-window=1 ~/MyCode/ansible/ /mnt/UbuntuData/UbuntuBackup/ansible_20
    echo -e "\n\e[32m"dotfiles"\e[m"
    rsync -avhl --delete --exclude '.git' --modify-window=1 ~/MyCode/dotfiles/ /mnt/UbuntuData/UbuntuBackup/Files/dotfiles
    echo -e "\n\e[32m"pycharm"\e[m"
    rsync -avhl --delete --exclude '.git' --modify-window=1 ~/.local/share/JetBrains/PyCharm*/ /mnt/UbuntuData/UbuntuBackup/Files/PyCharm
    echo -e "\n\e[32m"themes"\e[m"
    rsync -avhl --delete --modify-window=1 ~/.themes/ /mnt/UbuntuData/UbuntuBackup/Files/.themes
    echo -e "\n\e[32m"ssh"\e[m"
    rsync -avhl --delete --modify-window=1 ~/.ssh/ /mnt/UbuntuData/UbuntuBackup/Files/.ssh
    echo -e "\e[32m"backup completed!"\e[m"
end

function backup_test -d "backup"
    echo -e "\e[32m"ansible"\e[m"
    rsync -avhln --delete --exclude '.git' --modify-window=1 ~/MyCode/ansible/ /mnt/UbuntuData/UbuntuBackup/ansible_20
    echo -e "\n\e[32m"dotfiles"\e[m"
    rsync -avhln --delete --exclude '.git' --modify-window=1 ~/MyCode/dotfiles/ /mnt/UbuntuData/UbuntuBackup/Files/dotfiles
    echo -e "\n\e[32m"pycharm"\e[m"
    rsync -avhln --delete --exclude '.git' --modify-window=1 ~/.local/share/JetBrains/PyCharm*/ /mnt/UbuntuData/UbuntuBackup/Files/PyCharm
    echo -e "\n\e[32m"themes"\e[m"
    rsync -avhln --delete --modify-window=1 ~/.themes/ /mnt/UbuntuData/UbuntuBackup/Files/.themes
    echo -e "\n\e[32m"ssh"\e[m"
    rsync -avhln --delete --modify-window=1 ~/.ssh/ /mnt/UbuntuData/UbuntuBackup/Files/.ssh
    echo -e "\e[32m"backup completed!"\e[m"
end

function data_backup -d "data backup"
    set target_list itunes 画像 画像2 CG manga book
    for target in $target_list
        echo -e "\n\e[32m"$target"\e[m"
        sudo rsync -avhl --delete --modify-window=1 "/mnt/DATA1/$target/" "/mnt/EXHDD1/DataBackup/$target"
    end
    set target_list data Novel ROM USB VIDEO
    for target in $target_list
        echo -e "\n\e[32m"$target"\e[m"
        sudo rsync -avhl --delete --modify-window=1 "/mnt/DATA1/$target/" "/mnt/EXHDD2/DataBackup/$target"
    end
    echo -e "\e[32m"backup completed!"\e[m"
end

function data_backup_test -d "data backup"
    set target_list itunes 画像 画像2 CG manga book
    for target in $target_list
        echo -e "\n\e[32m"$target"\e[m"
        sudo rsync -avhln --delete --modify-window=1 "/mnt/DATA1/$target/" "/mnt/EXHDD1/DataBackup/$target"
    end
    set target_list data Novel ROM USB VIDEO
    for target in $target_list
        echo -e "\n\e[32m"$target"\e[m"
        sudo rsync -avhln --delete --modify-window=1 "/mnt/DATA1/$target/" "/mnt/EXHDD2/DataBackup/$target"
    end
    echo -e "\e[32m"backup completed!"\e[m"
end

function windows_backup -d "windows backup"
    echo -e "\n\e[32m"portable"\e[m"
    sudo rsync -avhl --delete --modify-window=1 "/mnt/Windows10/portable/" "/mnt/DATA2/WindowsBackup/portable"
    echo -e "\n\e[32m"bat"\e[m"
    sudo rsync -avhl --delete --modify-window=1 "/mnt/DATA1/bat/" "/mnt/DATA2/WindowsBackup/bat"
    echo -e "\e[32m"backup completed!"\e[m"
    sudo rsync -avhl --delete --modify-window=1 "/mnt/DATA1/setup/" "/mnt/DATA2/WindowsBackup/setup"
    echo -e "\e[32m"backup completed!"\e[m"
end

# fish
function view_fish -d "view fish settings"
    cat ~/.config/fish/config.fish
end

function update_fish -d "update fish settings"
    source ~/.config/fish/config.fish
end

function edit_fish -d "edit fish settings"
    nvim ~/.config/fish/config.fish
    update_fish
end

function view_functions -d "list functions"
    grep "^function" ~/.config/fish/config.fish | awk -F'[ ]' -v 'ORS=\n' 'BEGIN {print "=======Funcsions======="} {print $2,$4,$5,$6} END {print "==========END=========="}'
end

function zip_comic -d "make zip file at /manga folder"
    cd /mnt/EXHDD1/DataBackup/manga/
    set target_list (ls)
    for directory in $target_list
        if test -d $directory
            pushd $directory
            set comic_list (ls)
            for comic in $comic_list
                if test -d $comic
                    tar -cvf $comic.zip --use-compress-prog=pigz $comic
                    if test $status -eq 0
                        rm -rf $comic
                    end
                end
            end
            popd
        end
    end
end

function unzip_comic -d "make zip file at /manga folder"
    cd /mnt/EXHDD1/DataBackup/manga/
    set target_list (ls)
    for directory in $target_list
        if test -d $directory
            pushd $directory
            set comic_list (ls *.zip)
            for comic in $comic_list
                unzip $comic
                if test $status -eq 0
                    rm -rf $comic
                end
            end
            popd
        end
    end
end

function reject_space -d "remove space in directory name"
    set target_list (find ./ -type d | grep '.*\]\ .*' | sed 's/\ //')
    set name_list (find . -type d | grep '.*\]\ .*')
    for i in (seq (count $name_list))
        mv $name_list[$i] $target_list[$i]
    end
end
