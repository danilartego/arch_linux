#!/bin/bash

# Установки git и средства для разработки
sudo pacman -S git base-devel

# Установки репозитария AUR
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si