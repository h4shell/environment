FROM cruizba/ubuntu-dind

ARG username=user
ARG password=password

RUN apt-get update && apt-get install -y openssh-server git sudo
RUN mkdir /var/run/sshd
RUN useradd -m ${username}
COPY .bashrc /home/${username}/
COPY tunnel /usr/bin/
COPY entrypoint.sh /usr/bin/
RUN mkdir /home/${username}/.ssh
RUN ssh-keygen -t rsa -b 4096 -f /home/${username}/.ssh/id_rsa_env -N ''
RUN mv /home/${username}/.ssh/id_rsa_env.pub /home/${username}/.ssh/authorized_keys
RUN chown -R ${username}:${username} /home/${username}/
RUN usermod -aG root ${username}
RUN usermod -aG sudo ${username}
RUN echo ${username}:${password} | chpasswd
RUN usermod -s /bin/bash ${username}