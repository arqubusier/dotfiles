#!/bin/bash
set -e
set -x

# Install arch packages
deps="git rxvt-unicode rofi xdotool wmctrl wmname"
sudo pacman -S $deps

# Install yay aur helper
dir=$(pwd)
aur=~/aur
mkdir -p "$aur"
cd "$aur"
if [ -f yay-git ]; then
    git clone https://aur.archlinux.org/yay-git.git
    cd yay-git
else
    cd yay-git
    git pull
fi
makepkg -si
cd "$dir"

# Install aur packages
deps_aur="greenclip"
yay -S $deps_aur
