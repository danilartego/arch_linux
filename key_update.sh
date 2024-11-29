#!/bin/bash

# Настройка arch pacman keys

sudo pacman-key --init
sudo pacman-key --populate
sudo pacman -Sy archlinux-keyring --noconfirm
sudo pacman -Su --noconfirm