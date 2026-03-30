#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Aniket Pandey | Reg: 24BSA10012

PACKAGE="git"

# Check if package is installed
# Git Bash on Windows doesn't have rpm, so we use 'command -v' instead
if command -v $PACKAGE &>/dev/null; then
    echo "$PACKAGE is installed."
    git --version | grep -E 'version'
else
    echo "$PACKAGE is NOT installed."
fi

# Case statement that prints a one-line philosophy note about each package
case $PACKAGE in
    git)
        echo "Git: Linus built this after a proprietary tool let him down — now everyone uses it."
        ;;
    httpd)
        echo "Apache: the web server that built the open internet."
        ;;
    mysql)
        echo "MySQL: open source at the heart of millions of apps."
        ;;
    vlc)
        echo "VLC: built by students who just wanted to watch videos freely."
        ;;
    firefox)
        echo "Firefox: a nonprofit fighting to keep the web open for everyone."
        ;;
esac