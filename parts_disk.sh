#!/bin/bash

# Arch Linux
# Разбиение диска под linux

clear

if [ -f "./VARIABLE" ]
  then
  source ./VARIABLE
  else
  echo "Задать переменые для установки"
  echo "Запустите перед установкой - set_var"
  exit
fi

loadkeys ru
setfont cyr-sun16

echo 'Синхронизация системных часов'
timedatectl set-ntp true

# echo 'Размонтирование всех дисков'
# umount -a

# read -p "Введите имя диска для установки (sda, sdb или nvme0n1 ): " disk

echo "Удаление всех разделов на диске: $disk"
(
  echo g;
  echo w;
) | fdisk /dev/$disk

echo "Разбиение диска: $disk"
(
  echo g;
  echo n;
  echo ;
  echo ;
  echo +1G;
  echo t;
  echo 1;
  
  echo n;
  echo ;
  echo ;
  echo +100G;
  
  echo n;
  echo ;
  echo ;
  echo ;
  echo w;
) | fdisk /dev/nvme0n1

echo 'Разбиение дисков'
echo '================'

mkfs.fat -F32 /dev/${disk}p1
mkfs.btrfs -f /dev/${disk}p2
mkfs.btrfs -f /dev/${disk}p3

rm -rf /mnt/home
rm -rf /mnt/boot

echo 'Монтирование дисков'
echo '=================='

if [ -d "/mnt/boot/efi" ]
  then
  echo 'Уже есть директория /mnt/boot/efi'
  else
  mkdir -p /mnt/boot/efi
fi

if [ -d "/mnt/home" ]
  then
  echo 'Уже есть директория /mnt/home'
  else
  mkdir -p /mnt/home
fi