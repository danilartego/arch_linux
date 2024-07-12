#!/bin/bash

# Arch Linux
# Установка дополнительный пакетов и другого софта

clear

if [ -f "./VARIABLE" ]
  then
  source ./VARIABLE
  else
  echo "Задать переменые для установки"
  echo "Запустите перед установкой - set_var"
  exit
fi

echo 'Раскомментируем репозиторий multilib Для работы 32-битных приложений в 64-битной системе.'
echo '[multilib]' >> /etc/pacman.conf
echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
pacman -Syy

echo 'Установка дополнительных пакетов'
pacman -S $soft --noconfirm