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
rsync -a --delete --quiet --inplace --backup --backup-dir=/backup/incr/$DAY/home --exclude={'/dawid/Videos','/dawid/.local','/dawid/.steam','/dawid/.cache','/dawid/.wine','/dawid/Games','/dawid/Downloads','/dawid/dev'} /home/dawid /backup/full/home
