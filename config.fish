# path for linuxbrew
set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin" $fish_user_paths
# alias
# to update
alias update='sudo apt update; sudo apt -y upgrade; sudo apt -y full-upgrade; sudo apt -y autoclean; sudo apt -y autoremove'
# output code extensions
alias code_out='code --list-extensions > ~/dotfiles/vscode/extensions_list.txt'
# ghq
set GHQ_SELECTOR peco
set -U FZF_LEGACY_KEYBINDINGS 0
