FROM cruizba/ubuntu-dind
RUN apt-get update && apt-get install -y openssh-server git
RUN mkdir /var/run/sshd
RUN useradd -m h4shell
COPY .gitconfig /home/h4shell/
COPY authorized_keys /home/h4shell/.ssh/
RUN chmod 600 /home/h4shell/.ssh/authorized_keys
RUN chown -R h4shell:h4shell /home/h4shell/.ssh/
RUN usermod -aG root h4shell
RUN usermod -s /bin/bash h4shell