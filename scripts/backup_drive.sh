#!/bin/bash
# -anv means archive, dry run, and backup (keep one copy of any pre-existing files)
# add -n to do a dry run
echo "=============================================="
echo $(date) >> /home/gus/logs/backup_drive.log
sudo rsync -avb --suffix .$(date +%Y%m%d) /mnt/bendo4/SHARE/ /mnt/ben10/SHARE
