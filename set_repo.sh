#1 - цифра - это кол-во зеркал, которые вы хотите сохранить. При проблеме с одним скачивании переключится на следующее зеркало по списку
#2 - Сохраняет адреса исключительно с https
#3 - Сортирует список зеркал по скорости загрузки
#4 - Сохраняет список

sudo pacman -S reflector && reflector --verbose  -l 5 -p https --sort rate --save /etc/pacman.d/mirrorlist && pacman -Syyu


# Server = https://geo.mirror.pkgbuild.com/$repo/os/$arch
# Server = https://mirror.rackspace.com/archlinux/$repo/os/$arch
# Server = https://mirror.leaseweb.net/archlinux/$repo/os/$arch