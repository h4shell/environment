#!/bin/bash

echo "Enter your name:"
read GIT_NAME
echo "Enter your email:"
read GIT_EMAIL
echo "[user] name = ${GIT_NAME} email = ${GIT_EMAIL}" > .gitconfig
docker cp .gitconfig enviroment-server:/home/user/.gitconfig
docker exec -it enviroment-server chown user:user /home/user/.gitconfig
rm .gitconfig
