#!/bin/bash

docker cp enviroment-server:/home/user/.ssh/id_rsa_env /home/user/.ssh/

echo 'Host enviroment
        HostName 127.0.0.1
        User user
        Port 2222
        IdentityFile /home/$USER/.ssh/id_rsa_env' >> /home/user/.ssh/config



  