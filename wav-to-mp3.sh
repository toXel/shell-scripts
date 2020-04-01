#!/bin/sh

# Path that should be checked for wav files (without trailing slash!)
WATCH_PATH='/home/timo/Music'
QUALITY=5
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

currentYear=`date '+%Y'`
mp3Dir="${WATCH_PATH}/MP3/${currentYear}"
wavDir="${WATCH_PATH}/WAV ${currentYear}"

# Create MP3 dir if it's not already there
if [ ! -d "${mp3Dir}" ]
then
  mkdir -p "${mp3Dir}"
fi

# Create WAV dir if it's not already there
if [ ! -d "${wavDir}" ]
then
  mkdir -p "${wavDir}"
fi

for file in $WATCH_PATH/*.{wav,aifc}
do
  filename=$(basename "${file}")
  filename=${filename%.*}
  ffmpeg -i "${file}" -acodec libmp3lame -aq $QUALITY "${WATCH_PATH}/IN_PROGRESS.mp3"
  mv "${WATCH_PATH}/IN_PROGRESS.mp3" "${mp3Dir}/${filename}.mp3"
  mv "${file}" "${wavDir}/"
done
