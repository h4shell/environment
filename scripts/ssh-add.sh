#!/bin/bash

sudo cp $HOME/.local/share/containers/storage/volumes/environment_ssh/_data/id_rsa_env $HOME/.ssh/id_rsa_env
chmod 600 $HOME/.ssh/id_rsa_env &
ssh-add $HOME/.ssh/id_rsa_env