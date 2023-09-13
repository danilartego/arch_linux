#!/bin/bash

# Arch Linux Install v.1.0.1
# Разбивка, форматирование и монтирование дисков
# Протестирован на версии сентябрь 2023

loadkeys ru
setfont cyr-sun16

echo 'Синхронизация системных часов'
timedatectl set-ntp true

echo 'Удаление всех разделов'
(
  echo g;
  echo w;
) | fdisk /dev/nvme0n1

echo 'Разбиение дисков'
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

mkfs.fat -F32 /dev/nvme0n1p1
mkfs.btrfs -f /dev/nvme0n1p2
mkfs.btrfs -f /dev/nvme0n1p3

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

mount /dev/nvme0n1p2 /mnt
mount /dev/nvme0n1p3 /mnt/home