#!/usr/bin/env bash

WATCH_PATH='/home/timo/Music'
QUALITY=5

for file in $WATCH_PATH/*.wav
do
  ffmpeg -i "${file}" -acodec libmp3lame -aq $QUALITY "${file}.mp3"
done