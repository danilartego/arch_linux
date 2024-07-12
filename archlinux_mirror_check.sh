#!/bin/bash

# Тут ещё стоит упомянуть, что в Арче пакеты могут прыгать из extra в community и наоборот. А могут и вообще вернуться 
# обратно в AUR. Поэтому некоторые исключения со временем могут стать невалидными. Чтобы проверить, какие файлы были 
# действительно исключены во время создания зеркала, можно воспользоваться таким скриптом:

REMOTE=rsync://mirror.yandex.ru/archlinux
LOCAL=~/mirror/archlinux

check() {
  echo "Checking $1"
  rsync --recursive --verbose --dry-run --copy-links --stats --human-readable \
    $REMOTE/$1 $LOCAL >archlinux-mirror-check-$1.log
}

check core
check extra
check community
check multilib
check iso
check iso