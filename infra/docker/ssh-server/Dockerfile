FROM cruizba/ubuntu-dind
# Installa OpenSSH Server
RUN apt-get update && apt-get install -y openssh-server git
RUN mkdir /var/run/sshd
# Imposta una password per l'utente "root" (cambia 'password' con la tua password desiderata)
RUN useradd -m h4shell
COPY authorized_keys /home/h4shell/.ssh/
RUN chmod 600 /home/h4shell/.ssh/authorized_keys
RUN chown -R h4shell:h4shell /home/h4shell/.ssh/
RUN usermod -aG root h4shell
RUN usermod -s /bin/bash h4shell

# Avvia il servizio SSH durante l'avvio del container