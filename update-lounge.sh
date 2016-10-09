#!/usr/bin/env sh
# Update and restart The Lounge from GitHub master branch

cd ~/lounge
echo 'Pull changes from GitHub...'
git pull

echo 'Execute npm install...'
npm install
cd ~

echo 'Restart The Lounge...'
svc -h service/lounge

echo 'Done.'