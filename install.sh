#!/bin/bash

if [ "$EUID" -ne "0" ]; then
   echo "Solo l'amministratore può eseguire questa operazione!"
   echo ""
   exit 1
fi

if [ -f /etc/init.d/raspberryap ]; then
   echo "Aggiorno il servizio"
   cp raspberryap /etc/init.d/
   chmod +x /etc/init.d/raspberryap
   chown root:root /etc/init.d/raspberryap
   systemctl daemon-reload
   exit 0
fi

echo "Sto abilitando lo script come servizio"

cp $PWD/raspberryap /etc/init.d/
chmod +x /etc/init.d/raspberryap
chown root:root /etc/init.d/raspberryap
update-rc.d raspberryap defaults
systemctl enable raspberryap

echo "Creazione del file di configurazione basilare"
echo -e "INTERFACE=wlan0\nESSID=RaspberryAP\nCHANNEL=10\nTYPE_ESSID=0\n# PASSWORD DI PROVA. CAMBIALA!\nWPA=12345678" > /etc/raspberryap.conf

echo "Completato. Si consiglia di modificare il file di configurazione '/etc/raspberryap.conf'"

exit 0
