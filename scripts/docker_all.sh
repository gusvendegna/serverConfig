#!/bin/bash

# Check if the user provided an argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 [up|down]"
  exit 1
fi

# Set the command based on the argument
if [ "$1" = "up" ]; then
  command="up -d"
elif [ "$1" = "down" ]; then
  command="down"
else
  echo "Invalid argument: $1. Use 'up' or 'down'."
  exit 1
fi

# Loop through directories and execute the command
for dir in /home/gus/docker/* ; do
  if [ -d "$dir" ]; then
    docker compose --file "$dir/docker-compose.yml" $command
  fi
done
