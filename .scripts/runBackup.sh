#!/bin/sh

DAY=$(date +%A)

if [ -e /backup/incr/$DAY ] ; then
  rm -fr /backup/incr/$DAY
  mkdir /backup/incr/$DAY
fi

rsync -a --delete --quiet --inplace --backup --backup-dir=/backup/incr/$DAY /etc /backup/full
rsync -a --delete --quiet --inplace --backup --backup-dir=/backup/incr/$DAY --exclude '/var/cache/*' /var /backup/full
rsync -a --delete --quiet --inplace --backup --backup-dir=/backup/incr/$DAY /root /backup/full
rsync -a --delete --quiet --inplace --backup --backup-dir=/backup/incr/$DAY /boot /backup/full

TARGET_USER=dawid
mkdir -p /backup/incr/$DAY/home/$TARGET_USER
mkdir -p /backup/full/home/$TARGET_USER

HOME_DIRS_TO_SYNC=(.config .scripts Documents Pictures)

for dir in ${HOME_DIRS_TO_SYNC[*]}; do
  rsync -a --delete --quiet --inplace --backup --backup-dir=/backup/incr/$DAY/home/$TARGET_USER/$dir /home/$TARGET_USER/$dir /backup/full/home/$TARGET_USER
done

