sudo pacman -S reflector && reflector --verbose  -l 5 -p https --sort rate --save /etc/pacman.d/mirrorlist && pacman -Syyu

# Server = https://geo.mirror.pkgbuild.com/$repo/os/$arch
# Server = https://mirror.rackspace.com/archlinux/$repo/os/$arch
# Server = https://mirror.leaseweb.net/archlinux/$repo/os/$arch