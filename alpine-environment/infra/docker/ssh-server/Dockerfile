FROM docker:latest
ARG username=user
ARG password=password
COPY tunnel.sh /usr/bin/tunnel
COPY .bashrc /home/${username}/.bashrc
RUN apk update
RUN apk add openssh-server npm git bash sudo
RUN echo "${username} ALL=(ALL:ALL) ALL" >> /etc/sudoers
RUN adduser ${username} -h /home/user -s /bin/bash -D
RUN echo "${username}:${password}" | chpasswd
RUN mkdir -p /home/${username}/.ssh
RUN ssh-keygen -A
RUN ssh-keygen -t rsa -b 4096 -f /home/user/.ssh/id_rsa_env -N ''
RUN cat /home/user/.ssh/id_rsa_env.pub >> /home/user/.ssh/authorized_keys
RUN addgroup ${username} docker
COPY sshd_config /etc/ssh/sshd_config
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "sh", "/entrypoint.sh" ]
