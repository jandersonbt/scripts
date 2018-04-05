#!/bin/bash

# Ensure script is run as root
if [[ $EUID > 0 ]]
  then echo "Please run this script as root!"
  exit
fi

/usr/bin/apt-get -y autoremove
/usr/bin/apt-get -y autoclean
/sbin/shutdown -r +1
echo "Script complete"
echo "Rebooting in 60 seconds..."
