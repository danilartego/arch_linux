#!/bin/bash

# Arch Linux
# Добавление пользователей

clear

if [ -f "./VARIABLE" ]
  then
  source ./VARIABLE
  else
  echo "Задать переменые для установки"
  echo "Запустите перед установкой - set_var"
  exit
fi

echo 'Прописываем имя компьютера'
echo $hostname > /etc/hostname

echo 'Добавляем пользователя'
useradd -m -g users -G wheel -s /bin/bash $username

echo 'Создаем root пароль'
passwd

echo 'Устанавливаем пароль пользователя'
passwd $username

echo 'Устанавливаем SUDO'
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

