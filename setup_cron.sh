#!/bin/sh

# Ensure script is run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run this script as root!"
  exit
fi

crontab -l > newcron
echo "0 4 * * 1 /usr/bin/apt-get -y autoremove; /usr/bin/apt-get -y autoclean > /dev/null 2>&1" >> newcron
echo "30 4 1,15 * * /sbin/shutdown -r +3 > /dev/null 2>&1" >> newcron
crontab newcron
rm newcron