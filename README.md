# RaspberryAP 
> *Persistent and intelligent AP for Raspberry Pi!*

# Descrizione
*RaspberryAP* ti permette di creare un access point in maniera facile e veloce sul tuo Raspberry!
Ciò che lo rende diverso da tutti gli altri simili è che qui è possibile *impostare delle reti
wifi in cui far collegare il nostro raspberry pi nel caso ci si trovasse nelle vicinanze*.
In caso contrario, *RaspberryAP* si trasformerà automaticamente in un router dandoci comunque la
possibilità di collegarci ad esso. Inoltre questo sistema analizza anche la potenza della rete in
cui *RaspberryAP* dovrà connettersi: questo significa che se stiamo nel raggio d'azione dell' AP ma il
"segnale" non è abbastanza ottimale per il collegamento, *RaspberryAP* la ignorera' e al suo posto
creera' un access point.
Un altra peculiarita' e' che se si abilita la ri-scansione automatica, lo script controllera' sempre se nei
paragi e' disponibile almeno una delle reti inserite nel file di confiurazione, e in caso positivo spegnera'
in modo automaticao la modalita' AP (se e' abilitata e se non e' collegato nessuno ovviamente) e cerchera' di collegarsi all Access Point appena trovato.

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

RaspberryAP necessita di un file di configurazione '*raspberryap.conf*' collocato in ```/etc```.
Le linee che iniziano con uno spazio o un '#' saranno ignorate.
Le keyword che andranno nel file di configurazione sono:

| *Keyword* | *Descrizione* |
| --- | --- |
|**INTERFACE**|***Interfaccia da utilizzare per il collegamento/creazione dell'access point***|
|**ESSID**|***ESSID da assegnare all'access point che RaspberryAP creerà***|
|**CHANNEL**|*Canale dell'access point creato. Se non impostato, il canale verrà scelto in maniera casuale*
|**WPA**|*Password da utilizzare per la creazione dell'access point. Anche se opzionale, SE NE CONSIGLIA L'USO*
|**TYPE_ESSID**|*Valore di visiblita' dell'ESSID dell'access point. '0' l' AP sarà visibile, '1' l'AP avrà l'ESSID nascosto*|
|**ESSID_CHECK**|*Tutti gli AP a cui il RaspberryAP dovra' collegarsi. In caso contrario verra' creato un AP. I vari AP vanno suddivisi con una ```,```. *Esempio:* ```ESSID_CHECK=Router1:/etc/wparouter.conf,Router2:/etc/wparouter2.conf,...```*|
|**RX_MAX**|*Valore intero. Specifica il minimo valore che il segnale dell AP, a cui ci colleghiamo, deve avere(specificati in 'ESSID_CHECK'). Il valore di default è 68dbm. Se il valore e' maggiore(e quindi sinonimo di cattiva qualità della connessione) il suddetto ESSID verrà ignorato*|
|**FORCE_RESCAN**|*Forza la riscansione. Il valore deve essere un numero intero che rappresentera' i minuti di "pausa" prima di ogni scansione*|

> ***Le keyword devono essere in maiuscolo!***

# Installazione

Digitare da utente *root*:

```
   ./install.sh
```

Questo creerà un servizio usando il sistema degli rc.d.

# Utilizzo

Per vedere lo stato, digitate:

```
   service raspberryap status
```

Per controllare solo il file di configurazione (compreso la sintassi del file), digitate:

```
   service raspberryap check_conf
```

Se non viene riportato nulla, significa che tutto è corretto.
In caso contrario, terminerà con uno stato di uscita pari a '1'(errore) e il relativo errore.

# Donazioni

**BTC:** *3EwV4zt9r5o4aTHyqjcM6CfqSVirSEmN6y*

# Contatti

**Email:** *developer.vincenzog@gmail.com*
