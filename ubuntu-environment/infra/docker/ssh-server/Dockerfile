FROM cruizba/ubuntu-dind

ARG username=user
ARG password=password
ARG DIR=/usr/bin

RUN apt-get update && apt-get install -y openssh-server git sudo
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
RUN curl --location --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && sudo dpkg -i cloudflared.deb
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