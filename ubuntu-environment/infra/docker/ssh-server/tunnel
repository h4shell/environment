#!/bin/bash

# Verifica che sia stato fornito almeno un parametro
if [ $# -eq 0 ]; then
    echo "Usage: $0 <port>"
    exit 1
fi

# Prendi la porta dal primo parametro
port=$1

# Esegui il comando SSH con la porta fornita
ssh -R 80:localhost:${port} nokey@localhost.run
