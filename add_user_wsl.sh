#!/bin/bash

# Настройка arch wsl

# Добавление группы wheel
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel


read -p "Задать пароль для root (y/n): " root_item

case $root_item in
  y|Y)
    # Ввести пароль для root
    echo "Введите пароль для root: "
    passwd
    ;;
  n|N) 
    echo "Ввели «n», завершаем..."
    exit 0
    ;;
  *) 
    echo "Ничего не ввели. завершаем..."
    exit 0
    ;;
esac


read -p "Добавить нового пользователя (y/n): " user_item

case $user_item in
  y|Y)
    # Добавление пользователя
    read -p "Добавление нового пользователя, введите имя: " user_name
    useradd -m -G wheel -s /bin/bash $user_name
    # Ввести пароль для нового пользователя
    echo "Введите пароль для $user_name: " 
    passwd $user_name
    ;;
  n|N) 
    echo "Ввели «n», завершаем..."
    exit 0
    ;;
  *) 
    echo "Ничего не ввели. завершаем..."
    exit 0
    ;;
esac


read -p "Добавить имя хоста и пользователя по умолчанию (y/n): " host_item

case $host_item in
  y|Y)
    # Добавлениие имени Хоста
    read -p "Введите имя хоста: " host_name
    # Добавление пользователя по умолчанию
    read -p "Введите пользователя по умолчанию: " user_default
    # Добавление пользователя по умолчанию в wsl.conf
    echo "[user]" >> /etc/wsl.conf
    echo "default=$user_default" >> /etc/wsl.conf
    # Добавление имени хоста в wsl.conf
    echo "[network]" >> /etc/wsl.conf
    echo "hostname=$host_name" >> /etc/wsl.conf
    echo "generateHosts=false" >> /etc/wsl.conf
    ;;
  n|N) 
    echo "Ввели «n», завершаем..."
    exit 0
    ;;
  *) 
    echo "Ничего не ввели. завершаем..."
    exit 0
    ;;
esac

exit