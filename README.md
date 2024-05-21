## Repository "environment"

Il repository "environment" ospita le configurazioni e gli script per creare un ambiente di sviluppo Docker, focalizzato sull'utilizzo di un server SSH e il tunneling delle porte tramite `localhost.run`.

### Utilizzo

esegui

```
$ docker compose up -d
```

Per installare la chiave nell'host è sufficiente

```
$ ./scripts/ssh-add.sh
```

per collegarti all'enviroment apri VSCode scarica l'estensione "Remote explorer" aggiungi un nuovo server SSH e inserisci questi parametri

```
Host dind_enviroment_localhost
    HostName 127.0.0.1
    User user
    Port 2222
    IdentityFile ~/.ssh/id_rsa_env
```

Una volta collegato dalla bash puoi configurare il tuo account git semplicemente digitando nella console

```
$ ./scripts/gitcongig.sh
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
