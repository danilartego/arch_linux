#!/bin/bash

# Самый простой способ создать себе локальную копию репозитория с пакетами - сделать rsync с одним из живых официальных 
# зеркал. Узнать список и проверить статус зеркала можно на страничке https://archlinux.org/mirrors/status/#successful 
# Их там сотни. Для примера взят сервер яндекса. Создать зеркало можно вот таким простым скриптом:

#REMOTE=rsync://mirror.clientvps.com/archlinux/
REMOTE=rsync://mirror.moson.org/arch/

LOCAL=/mnt/d/arch_reposit_mirror

mirror() {
  echo "Mirroring $1"
  rsync --recursive --hard-links --safe-links --copy-links --times \
    --delete-after --delete-excluded \
    --info=progress2 --stats --human-readable \
    --filter="merge _filter_mirrors.txt" \
    $REMOTE/$1 $LOCAL
}

mirror core
mirror extra
mirror community
mirror multilib
mirror iso
