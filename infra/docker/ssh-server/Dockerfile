FROM cruizba/ubuntu-dind
RUN apt-get update && apt-get install -y openssh-server git sudo
RUN mkdir /var/run/sshd
RUN useradd -m h4shell
COPY .gitconfig /home/h4shell/
COPY .bashrc /home/h4shell/
COPY tunnel /usr/bin/
RUN mkdir /home/h4shell/.ssh
RUN ssh-keygen -t rsa -b 4096 -f /home/h4shell/.ssh/id_rsa_env -N ''
RUN mv /home/h4shell/.ssh/id_rsa_env.pub /home/h4shell/.ssh/authorized_keys
RUN chown -R h4shell:h4shell /home/h4shell/.ssh

RUN usermod -aG root h4shell
RUN usermod -aG sudo h4shell
RUN echo 'h4shell:password' | chpasswd
RUN usermod -s /bin/bash h4shell