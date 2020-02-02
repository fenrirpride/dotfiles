# path for linuxbrew
set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin" $fish_user_paths

# ghq
set GHQ_SELECTOR peco
set -U FZF_LEGACY_KEYBINDINGS 0

# set PATH
set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
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

function view_ex -d "view list vscode extensions"
    cat ~/MyCode/dotfiles/Code/extensions_list.txt
end

# pycharm
function py_out -d "make list of pycharm plugins"
    cd ~/.PyCharm*/config/plugins
    ls -d -1 */ | sed -e 's/\///g' > ~/MyCode/dotfiles/pycharm/extensions_list.txt
    ls -1 | grep jar | sed -e 's/.jar//g' >> ~/MyCode/dotfiles/pycharm/extensions_list.txt
    cd
end

# narou
function narouu -d "narou update"
    cd /mnt/DATA1/Novel
    narou u
    cd
    epub
end

function naroud -d "narou download"
    cd /mnt/DATA1/Novel
    narou d $argv
    cd
end

function epub -d "epub upload dropbox"
    find /mnt/DATA1/Novel/ -name \*.epub | while read line
    cp -vu "$line" /mnt/DATA1/online/Dropbox/epub | awk -F'[\''/']' -v 'ORS=\n' '{print $9}'
    end
    rsync -avL --delete /mnt/DATA1/online/Dropbox/epub/ ~/pCloudDrive/epub | grep "epub" > /dev/null 2>&1
    if  test $status -eq 0
        echo -e "\e[32m"Update completed!"\e[m"
    else
        echo -e "\e[32m"No updates!"\e[m"
    end
end

# backup
function backup -d "backup"
    echo -e "\e[32m"ansible"\e[m"
    rsync -avhL --delete --modify-window=1 ~/MyCode/ansible/ /mnt/UbuntuData/UbuntuBackup/ansible
    echo -e "\n\e[32m"dotfiles"\e[m"
    rsync -avhL --delete --modify-window=1 ~/MyCode/dotfiles/ /mnt/UbuntuData/UbuntuBackup/Files/dotfiles
    echo -e "\n\e[32m"pycharm"\e[m"
    rsync -avhL --delete --modify-window=1 ~/.PyCharmCE2019.3/ /mnt/UbuntuData/UbuntuBackup/Files/.PyCharmCE2019.3
    echo -e "\n\e[32m"themes"\e[m"
    rsync -avhL --delete --modify-window=1 ~/.themes/ /mnt/UbuntuData/UbuntuBackup/Files/.themes
    echo -e "\n\e[32m"ssh"\e[m"
    rsync -avhL --delete --modify-window=1 ~/.ssh/ /mnt/UbuntuData/UbuntuBackup/Files/.ssh
    echo -e "\n\e[32m"wordpress"\e[m"
    rsync -avhL --delete --modify-window=1 ~/MyCode/wordpress/ /mnt/UbuntuData/UbuntuBackup/wordpress
    echo -e "\n\e[32m"AppImages"\e[m"
    rsync -avhL --delete --modify-window=1 ~/.AppImages/ /mnt/UbuntuData/UbuntuBackup/Files/.AppImages
    echo -e "\n\e[32m"dict"\e[m"
    rsync -avhL --delete --modify-window=1 ~/.goldendict/dict/ /mnt/UbuntuData/UbuntuBackup/Files/dict
    echo -e "\n\e[32m"deb"\e[m"
    rsync -avhL --delete --modify-window=1 /mnt/UbuntuData/UbuntuBackup/Files/deb/ ~/pCloudDrive/UbuntuBackup/deb
    echo -e "\e[32m"backup completed!"\e[m"
end

function backup_test -d "backup dry run"
    echo -e "\e[32m"ansible"\e[m"
    rsync -avhLn --delete --modify-window=1 ~/MyCode/ansible/ /mnt/UbuntuData/UbuntuBackup/ansible
    echo -e "\n\e[32m"dotfiles"\e[m"
    rsync -avhLn --delete --modify-window=1 ~/MyCode/dotfiles/ /mnt/UbuntuData/UbuntuBackup/Files/dotfiles
    echo -e "\n\e[32m"pycharm"\e[m"
    rsync -avhLn --delete --modify-window=1 ~/.PyCharmCE2019.3/ /mnt/UbuntuData/UbuntuBackup/Files/.PyCharmCE2019.3
    echo -e "\n\e[32m"themes"\e[m"
    rsync -avhLn --delete --modify-window=1 ~/.themes/ /mnt/UbuntuData/UbuntuBackup/Files/.themes
    echo -e "\n\e[32m"ssh"\e[m"
    rsync -avhLn --delete --modify-window=1 ~/.ssh/ /mnt/UbuntuData/UbuntuBackup/Files/.ssh
    echo -e "\n\e[32m"wordpress"\e[m"
    rsync -avhLn --delete --modify-window=1 ~/MyCode/wordpress/ /mnt/UbuntuData/UbuntuBackup/wordpress
    echo -e "\n\e[32m"AppImages"\e[m"
    rsync -avhLn --delete --modify-window=1 ~/.AppImages/ /mnt/UbuntuData/UbuntuBackup/Files/.AppImages
    echo -e "\n\e[32m"dict"\e[m"
    rsync -avhLn --delete --modify-window=1 ~/.goldendict/dict/ /mnt/UbuntuData/UbuntuBackup/Files/dict
    echo -e "\n\e[32m"deb"\e[m"
    rsync -avhLn --delete --modify-window=1 /mnt/UbuntuData/UbuntuBackup/Files/deb/ ~/pCloudDrive/UbuntuBackup/deb
    echo -e "\e[32m"backup completed!"\e[m"
end



function data_backup -d "data backup"
    echo -e "\n\e[32m"itunes"\e[m"
    rsync -avhL --delete --modify-window=1 /mnt/DATA1/itunes/ /mnt/EXHDD1/DataBackup/itunes
    echo -e "\n\e[32m"画像"\e[m"
    rsync -avhL --delete --modify-window=1 /mnt/DATA1/画像/ /mnt/EXHDD1/DataBackup/画像
    echo -e "\n\e[32m"画像2"\e[m"
    # rsync -rlvhL --delete --modify-window=1 /mnt/DATA1/画像2/ /mnt/EXHDD1/DataBackup/画像2
    echo -e "\n\e[32m"book"\e[m"
    rsync -avhL --delete --modify-window=1 /mnt/DATA1/book/ /mnt/EXHDD2/DataBackup/book
    echo -e "\n\e[32m"data"\e[m"
    rsync -avhL --delete --modify-window=1 /mnt/DATA1/data/ /mnt/EXHDD2/DataBackup/data
    echo -e "\n\e[32m"manga"\e[m"
    rsync -avhL --delete --modify-window=1 /mnt/DATA1/manga/ /mnt/EXHDD2/DataBackup/manga
    echo -e "\n\e[32m"Novel"\e[m"
    rsync -rlvhL --delete --modify-window=1 /mnt/DATA1/Novel/ /mnt/EXHDD2/DataBackup/Novel
    echo -e "\n\e[32m"ROM"\e[m"
    rsync -avhL --delete --modify-window=1 /mnt/DATA1/ROM/ /mnt/EXHDD2/DataBackup/ROM
    echo -e "\n\e[32m"USB"\e[m"
    rsync -avhL --delete --modify-window=1 /mnt/DATA1/USB/ /mnt/EXHDD2/DataBackup/USB
    echo -e "\n\e[32m"VIDEO"\e[m"
    rsync -avhL --delete --modify-window=1 /mnt/DATA1/VIDEO/ /mnt/EXHDD2/DataBackup/VIDEO
    echo -e "\e[32m"backup completed!"\e[m"
end

function data_backup_test -d "data backup dry run"
    echo -e "\n\e[32m"itunes"\e[m"
    rsync -avhLn --delete --modify-window=1 /mnt/DATA1/itunes/ /mnt/EXHDD1/DataBackup/itunes
    echo -e "\n\e[32m"画像"\e[m"
    rsync -avhLn --delete --modify-window=1 /mnt/DATA1/画像/ /mnt/EXHDD1/DataBackup/画像
    echo -e "\n\e[32m"画像2"\e[m"
    # rsync -rlvhL --delete --modify-window=1 /mnt/DATA1/画像2/ /mnt/EXHDD1/DataBackup/画像2
    echo -e "\n\e[32m"book"\e[m"
    rsync -avhLn --delete --modify-window=1 /mnt/DATA1/book/ /mnt/EXHDD2/DataBackup/book
    echo -e "\n\e[32m"data"\e[m"
    rsync -avhLn --delete --modify-window=1 /mnt/DATA1/data/ /mnt/EXHDD2/DataBackup/data
    echo -e "\n\e[32m"manga"\e[m"
    rsync -avhLn --delete --modify-window=1 /mnt/DATA1/manga/ /mnt/EXHDD2/DataBackup/manga
    echo -e "\n\e[32m"Novel"\e[m"
    rsync -rlvhL --delete --modify-window=1 /mnt/DATA1/Novel/ /mnt/EXHDD2/DataBackup/Novel
    echo -e "\n\e[32m"ROM"\e[m"
    rsync -avhLn --delete --modify-window=1 /mnt/DATA1/ROM/ /mnt/EXHDD2/DataBackup/ROM
    echo -e "\n\e[32m"USB"\e[m"
    rsync -avhLn --delete --modify-window=1 /mnt/DATA1/USB/ /mnt/EXHDD2/DataBackup/USB
    echo -e "\n\e[32m"VIDEO"\e[m"
    rsync -avhLn --delete --modify-window=1 /mnt/DATA1/VIDEO/ /mnt/EXHDD2/DataBackup/VIDEO
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
    vim ~/.config/fish/config.fish
    update_fish
end

function view_functions -d "list functions"
    grep "^function" ~/.config/fish/config.fish | awk -F'[ ]' -v 'ORS=\n' 'BEGIN {print "=======Funcsions======="} {print $2,$4,$5,$6} END {print "==========END=========="}'
end

# byobu settings
status --is-login; and status --is-interactive; and exec byobu-launcher
