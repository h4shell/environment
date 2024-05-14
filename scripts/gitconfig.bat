@echo off

set /p GIT_NAME=Enter your name:
set /p GIT_EMAIL=Enter your email:

echo [user] > .gitconfig
echo name = %GIT_NAME% >> .gitconfig
echo email = %GIT_EMAIL% >> .gitconfig

docker cp .gitconfig environment-server:/home/user/.gitconfig
docker exec -it environment-server chown user:user /home/user/.gitconfig

del .gitconfig