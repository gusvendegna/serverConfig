#!/bin/bash
echo ""
echo ""
echo ""
echo "  ／l、       "      
echo "（ﾟ､ ｡ ７     "    
echo "  l  ~ヽ    "   
echo "  じしf_,)ノ"
echo ""
echo ""
echo ""

apt update
apt install powertop -y
apt install htop -y
apt install rsync -y
apt install samba -y
apt install smartmontools -y

# List current crontab entries
crontab -l > mycron

# Append new cron job to the list
echo "@reboot powertop --auto-tune" >> mycron
echo "0 0 * * * /home/gus/serverConfig/backup_docker_volumes.sh" >> mycron

# Install the new crontab
crontab mycron

# Remove temporary file
rm mycron
