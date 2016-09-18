#!/usr/bin/env bash

WATCH_PATH='/home/timo/Music'

# +----------------------------------------+
# |          Choose Quality (VBR)          |
# +----------------------------------------+
# | Quality | Avg. Bitrate | Bitrate range |
# +---------+--------------+---------------+
# |    0    |      245     |    220-260    |
# +---------+--------------+---------------+
# |    1    |      225     |    190-250    |
# +---------+--------------+---------------+
# |    2    |      190     |    170-210    |
# +---------+--------------+---------------+
# |    3    |      175     |    150-195    |
# +---------+--------------+---------------+
# |    4    |      165     |    140-185    |
# +---------+--------------+---------------+
# |    5    |      130     |    120-150    |
# +---------+--------------+---------------+
# |    6    |      115     |    100-130    |
# +---------+--------------+---------------+
# |    7    |      100     |     80-120    |
# +---------+--------------+---------------+
# |    8    |      85      |     70-105    |
# +---------+--------------+---------------+
# |    9    |      65      |     45-85     |
# +---------+--------------+---------------+
QUALITY=5

# Create original dir if it's not already there
if [ ! -d "${WATCH_PATH}/original" ]
then
  mkdir "${WATCH_PATH}/original"
fi

for file in "${WATCH_PATH}/*.wav"
do
  ffmpeg -i "${file}" -acodec libmp3lame -aq $QUALITY "${file}.mp3"
  mv "${file}" "${WATCH_PATH}/original/"
done