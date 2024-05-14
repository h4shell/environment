## Repository "environment"

Il repository "environment" ospita le configurazioni e gli script per creare un ambiente di sviluppo Docker, focalizzato sull'utilizzo di un server SSH e il tunneling delle porte tramite `localhost.run`.

### Struttura del Repository

Il repository è organizzato in modo da fornire un ambiente di sviluppo Docker completo e configurabile. La struttura principale comprende:

- `docker-compose.yml`: File di configurazione Docker Compose per definire i servizi necessari.
- `Dockerfile`: File Dockerfile per la creazione dell'immagine del server SSH.
- `tunnel`: Uno script bash per semplificare il tunneling delle porte tramite `localhost.run`.
- `.gitconfig`: Configurazioni per Git.
- `.bashrc`: File di configurazione per la shell Bash.

### Configurazioni Principali

#### docker-compose.yml

Il file `docker-compose.yml` definisce il servizio `environment-server` che crea un server SSH all'interno di un container Docker. Le configurazioni principali includono:

- `build`: Percorso della directory contenente il Dockerfile per la build del servizio.
- `privileged`: Abilita privilegi speciali per il container.
- `entrypoint`: Comando di avvio del container.
- `container_name`: Nome del container.
- `hostname`: Nome host del container.
- `restart`: Politica di restart del container.
- `ports`: Mapping delle porte del container.
- `volumes`: Volumi montati nel container, inclusi i volumi per la cartella SSH.

#### Dockerfile

Il file `Dockerfile` definisce la configurazione per la creazione dell'immagine del server SSH. Le azioni principali includono:

- Installazione dei pacchetti necessari tramite `apt-get`.
- Creazione di un utente `user`.
- Copia dei file di configurazione per Git e Bash.
- Generazione della chiave SSH e autorizzazione delle chiavi.
- Configurazione dell'utente `user` per l'accesso di root e sudo.
- Impostazione della password per l'utente `user`.
- Modifica della shell predefinita dell'utente `user`.

### Utilizzo

Per utilizzare questo ambiente assicurati di avere docker e docker compose installati all'ultima versione.

ignora localmente il file ssh/REMOVE_ME.txt con il seguente comando

```
$ git update-index --assume-unchanged ./ssh/REMOVE_ME.txt
```

esegui

```
$ docker compose up -d
```

puoi modificare i permessi della cartella ssh che dopo l'avvio del container conterrà la coppia di chiavi ssh

```
$ sudo chown -R user:user ./ssh
```

Per installare la chiave nell'host è sufficiente

```
$ ssh-add ./ssh/id_rsa_env
```

#### tunnel

Lo script `tunnel` semplifica il tunneling delle porte utilizzando `localhost.run`. Richiede la specifica di almeno una porta come argomento sulla riga di comando e quindi esegue il comando SSH per stabilire il tunnel.

```
$ tunnel 8080
```

### Avvertenze

- L'ambiente è configurato per scopi di sviluppo e testing. Assicurarsi di non esporre servizi sensibili pubblicamente.
- Utilizzare una password sicura per l'utente `user`.
- Prestare attenzione quando si utilizza il tunneling delle porte tramite servizi di terze parti come `localhost.run`.
