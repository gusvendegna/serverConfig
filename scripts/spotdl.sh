#!/bin/bash

# Define the music directory
MUSIC_DIR="/mnt/bendo4/SHARE/media/music"

# List of playlists (name and URL)
playlists=(
    # "dump_playlist https://open.spotify.com/playlist/2NOX2ZaxJ6NKfVDs8EWQ67?si=929cd344cbc44b46"
    # "late_nights https://open.spotify.com/playlist/1K91E1HtWp0PKjgMtuovHO?si=baa550fa38c246e4"
    # "notaphase https://open.spotify.com/playlist/1LXHvZJhuMNezUNZI9ub9U?si=66bff1363d0b4a93"
    # "unstable_women https://open.spotify.com/playlist/7gnhk765qTbXoGkGHTN35u?si=629a84ff28fb4502"
    # "yupee https://open.spotify.com/playlist/2qqjJ34mOAaWEIx8fNBDwB?si=5be4d88a693743c2"
    # "en_el_garaje https://open.spotify.com/playlist/6chwePfM44HJ9AYY3zlWuy?si=7fed17b23de1495d"
    "b_t_p https://open.spotify.com/playlist/4iLrgpUfRpBj45tvnEa0lC"
    "midwest_emo https://open.spotify.com/playlist/6iqHIszYUV3wHxQZmRZxWA"
)

for entry in "${playlists[@]}"; do
    name=$(echo "$entry" | awk '{print $1}')
    url=$(echo "$entry" | awk '{print $2}')
    echo "Downloading playlist: $name"
    docker run --rm -v "$MUSIC_DIR":/music spotdl/spotify-downloader download "$url"
done
