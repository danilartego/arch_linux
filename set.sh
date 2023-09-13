#!/bin/bash

# Arch Linux Install v.1.0.1
# Установка настроек
# Протестирован на версии сентябрь 2023

echo 'Установка основных пакетов'
pacstrap /mnt base linux linux-firmware nano dhcpcd netctl

echo 'Настройка системы, запись таблицы файловых систем'
genfstab -pU /mnt >> /mnt/etc/fstab

arch-chroot /mnt

read -p "Введите имя компьютера: " hostname
read -p "Введите имя пользователя: " username

echo 'Прописываем имя компьютера'
echo $hostname > /etc/hostname
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

echo 'Создадим загрузочный RAM диск'
mkinitcpio -p linux


echo 'Устанавливаем загрузчик'
mount /dev/nvme0n1p1 /mnt/boot/efi
pacman -Syy
pacman -S grub efibootmgr --noconfirm
grub-install /dev/nvme0n1

echo 'Обновляем grub.cfg'
grub-mkconfig -o /boot/grub/grub.cfg

# echo 'Ставим программу для Wi-fi'
# pacman -S dialog wpa_supplicant --noconfirm 

echo 'Добавляем пользователя'
useradd -m -g users -G wheel -s /bin/bash $username

echo 'Создаем root пароль'
passwd

echo 'Устанавливаем пароль пользователя'
passwd $username

echo 'Устанавливаем SUDO'
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

# reflector -l 3 --sort rate --save /etc/pacman.d/mirrorlist

# echo 'Раскомментируем репозиторий multilib Для работы 32-битных приложений в 64-битной системе.'
# echo '[multilib]' >> /etc/pacman.conf
# echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
# pacman -Syy