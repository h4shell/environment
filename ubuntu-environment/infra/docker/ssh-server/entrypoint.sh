#!/bin/bash
echo -e "[user]\n\
        name = ${GIT_NAME}\n\
        email = ${GIT_EMAIL}" \
        > /home/user/.gitconfig

chown -R user:user /home/user/

/usr/sbin/sshd -D -f /etc/ssh/sshd_config &
su user -c "code-server --bind-addr 0.0.0.0:8080 --auth none" &
dockerd
