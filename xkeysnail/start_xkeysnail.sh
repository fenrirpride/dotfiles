#!/bin/bash
if [ -x /usr/local/bin/xkeysnail ]; then
xhost +SI:localuser:root
sudo DISPLAY=$DISPLAY /usr/local/bin/xkeysnail /etc/opt/xkeysnail/config.py &
fi
