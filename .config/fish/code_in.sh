#!/bin/bash
while read line
do
    code --install-extension $line
done < ~/MyCode/dotfiles/Code/extensions_list.txt
