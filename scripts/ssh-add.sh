#!/bin/bash

docker cp environment-server:/home/user/.ssh/id_rsa_env /home/$USER/.ssh/
touch /home/$USER/.ssh/config
echo 'Host environment
        HostName 127.0.0.1
        User user
        Port 2222
        IdentityFile /home/'"$USER"'/.ssh/id_rsa_env' >> /home/$USER/.ssh/config