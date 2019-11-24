#!/bin/bash
if [ -x /usr/local/bin/xkeysnail ]; then
xhost +SI:localuser:xkeysnail
sudo -u xkeysnail DISPLAY=:0 /usr/local/bin/xkeysnail /etc/opt/xkeysnail/config.py &
fi
