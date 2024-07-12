#!/bin/bash

# Установки git и средства для разработки
sudo pacman -S git base-devel

# Установки из AUR отдельнгого приложения
git clone https://aur.archlinux.org/google-chrome.git
cd google-chrome/
makepkg -sri
yay -Ss google-chrome