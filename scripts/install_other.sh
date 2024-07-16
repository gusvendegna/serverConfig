#!/bin/bash

apt update
apt install powertop -y
apt install htop -y
apt install rsync -y

# List current crontab entries
crontab -l > mycron

# Append new cron job to the list
echo "@reboot powertop --auto-tune" >> mycron
echo "0 0 * * * /home/gus/docker/backup_docker_volumes.sh" >> mycron

# Install the new crontab
crontab mycron

# Remove temporary file
rm mycron
