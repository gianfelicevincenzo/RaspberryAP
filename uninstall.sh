#!/bin/bash

if [ "$EUID" -ne "0" ]; then
   echo "Solo l'amministratore può eseguire questa operazione!"
   echo ""
   exit 1
fi

if [ -f /etc/init.d/raspberryap ]; then
   echo "Rimozione servizio"
   systemctl disable raspberryap
   systemctl disable raspberryap.service
   update-rc.d raspberryap remove defaults
   update-rc.d raspberryap remove
   rm -rf /etc/init.d/raspberryap
   rm -rf /tmp/raspberryap
   systemctl daemon-reload
   exit 0