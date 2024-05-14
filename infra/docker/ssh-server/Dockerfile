FROM cruizba/ubuntu-dind
RUN apt-get update && apt-get install -y openssh-server git sudo
RUN mkdir /var/run/sshd
RUN useradd -m user
COPY .bashrc /home/user/
COPY tunnel /usr/bin/
RUN mkdir /home/user/.ssh
RUN ssh-keygen -t rsa -b 4096 -f /home/user/.ssh/id_rsa_env -N ''
RUN mv /home/user/.ssh/id_rsa_env.pub /home/user/.ssh/authorized_keys
RUN chown -R user:user /home/user/
RUN usermod -aG root user
RUN usermod -aG sudo user
RUN echo 'user:password' | chpasswd
RUN usermod -s /bin/bash user