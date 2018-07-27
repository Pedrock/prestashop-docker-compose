#!/bin/bash

env | sed -r "s/'/\\\'/gm" | sed -r "s/^([^=]+=)(.*)\$/\1'\2'/gm" > /etc/environment

ln -sf /proc/$$/fd/1 /var/log/cron.log
echo "$BACKUP_SCHEDULE /app/duplicacy-autobackup.sh backup >> /var/log/cron.log 2>&1" | crontab
/app/duplicacy-autobackup.sh init

if [[ $BACKUP_IMMEDIATLY == "yes" ]] || [[ $BACKUP_IMMEDIATELY == "yes" ]]; then # two spellings for retro-compatibility
    echo "Running a backup right now"
    /app/duplicacy-autobackup.sh backup
fi

cron -f