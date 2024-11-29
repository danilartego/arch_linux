#!/bin/bash

# Добавление группы wheel
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel

# Добавление пользователя
useradd -m -G wheel -s /bin/bash qw
passwd qw