# RaspberryAP 
> *Persistent and intelligent AP for Raspberry Pi!*

# Descrizione
*RaspberryAP* ti permette di creare un access point in maniera facile e veloce sul tuo Raspberry!
Ciò che lo rende diverso da tutti gli altri simili è che qui è possibile *impostare delle reti
wifi in cui far collegare il nostro raspberry pi se si trovasse nelle vicinanze della suddetta
rete*. In caso contrario, *RaspberryAP* si trasformerà automaticamente in un router
dandoci comunque la possibilità di collegarci ad esso. Inoltre questo sistema analizza anche la
potenza della nostra rete in cui *RaspberryAP* dovrà connettersi: questo significa che se anche stiamo
nel raggio d'azione della nostra rete ma il "segnale" non è abbastanza ottimale per il collegamento,
*RaspberryAP* la ignorerà è creerà un access point in modo da darci comunque la possibilità di connetterci ad esso.

# Dipendenze

- iw
- wireless-tools
- rfkill
- wpa_supplicant
- **dnsmasq**
- **hostapd**

Installare le dipendenze con:

```
   apt-get install iw wireless-tools rfkill wpa_supplicant dnsmasq hostapd
```

# Configurazione

RaspberryAP necessita di un file di configurazione 'raspberryap.conf' collocato in '/etc'.
Le linee che iniziano con uno spazio o un '#' saranno ignorate.
Le keyword che andranno nel file di configurazione sono:

 **Obbligatori**

- *INTERFACE*=*Interfaccia da utilizzare per il collegamento/creazione dell'access point*
- *ESSID*=*Nome da assegnare all'access point che RaspberryAP creerà*

 **Opzionali**

- CHANNEL=*Imposta il canale dell'access point appena creato. Se non impostata, il canale verrà scelto in maniera randomica*
- WPA=*Password da utilizzare per la creazione dell'access point. Anche se opzionale, SE NE CONSIGLIA L'USO*
- TYPE_ESSID=*Valore numerico di impostazione dell'ESSID dell'access point. Se impostato a '0' il nostro AP sarà visibile anche agli altri dispositivi mentre se impostato a '1' il nostro AP avrà l'ESSID nascosto e quindi non visibile agli altri dispositivi*
- ESSID_CHECK=*Qui andranno tutti gli ESSID che RaspberryAP controllerà prima di creare un access point in caso non ne trovasse nemmeno uno. La forma con cui gli essid vanno scritti è "*ESSID_CHECK=**PRIMO_ESSID**:/FILE/DI/WPA/CREATO/CON/WPAPASSPHRASE,**SECONDO_ESSID**:ecc..*". Il file di connessione va creato con wpa_passphrase e infine bisogna specificare il percorso di quest'ultimo nel file di configurazione. Esempio: 'ESSID_CHECK=router:/etc/wparouter.conf,router2:/etc/wparouter2.conf ...'*
- RX_MAX=*Valore numerico che imposta un riferimento del valore di ricezione del segnale dell'access point per il collegamento con uno degli ESSID specificati in 'ESSID_CHECK'. Il suo valore di default è 68dbm. Quindi se ci si trova con un ESSID di cui il segnale è maggiore di 68dbm(e quindi sinonimo di cattiva qualità della connessione) il suddetto ESSID verrà ignorato.*

**Tutte le keyword dovranno essere in maiuscolo!**

# Installazione

Digitare da utente *root*:

```
   ./install.sh
```

Questo crereà un servizio usando il sistema degli rc.d.

# Utilizzo

Dopo l'installazione è necessario riavviare per avere già tutto in funzione. Inoltre per vedere lo stato, digitate:

```
   service raspberryap status
```

e per controllare che tutto fili liscio(compreso la sintassi del file di configurazione), digitate:

```
   service raspberryap check
```

in caso di risposta 'OK' significa che tutto è corretto, altrimenti terminerà con un stato di uscita 1(errore) e il relativo errore.

# Donazioni

**BTC:** *3EwV4zt9r5o4aTHyqjcM6CfqSVirSEmN6y*

# Contatti

**Email:** *developer.vincenzog@gmail.com*
