#!/bin/bash

HOSTNAME=$(hostname)
URL="https://hc-ping.com/${PING_KEY}/${HOSTNAME}"

while true; do
  curl -fsS -m 10 "$URL" > /dev/null
  echo "Pinged at $(date)"
  sleep 300  # 5 minutes
done

