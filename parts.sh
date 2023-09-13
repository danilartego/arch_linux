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
  echo +500M;
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

echo 'Монтирование дисков'
echo '=================='

mkdir /mnt/boot/efi
mkdir /mnt/home

mount /dev/nvme0n1p1 /mnt/boot/efi
mount /dev/nvme0n1p2 /mnt
mount /dev/nvme0n1p3 /mnt/home