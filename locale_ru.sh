#!/bin/bash

# Arch Linux
# Установки RU локали

clear

# if [ -f "./VARIABLE" ]
#   then
#   source ./VARIABLE
#   else
#   echo "Задать переменые для установки"
#   echo "Запустите перед установкой - set_var"
#   exit
# fi

ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime

echo 'Добавляем русскую локаль системы'
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen 

echo 'Обновим текущую локаль системы'
locale-gen

echo 'Указываем язык системы'
echo 'LANG="ru_RU.UTF-8"' > /etc/locale.conf

echo 'Вписываем KEYMAP=ru FONT=cyr-sun16'
echo 'KEYMAP=ru' >> /etc/vconsole.conf
echo 'FONT=cyr-sun16' >> /etc/vconsole.conf