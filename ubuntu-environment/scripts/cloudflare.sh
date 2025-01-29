#!/bin/bash

docker compose logs cloudflare-env | grep -o 'https://[^ ]*\.trycloudflare\.com' | head -n 1 | sed 's/$/\/wetty/'


