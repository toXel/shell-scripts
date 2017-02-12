#!/bin/bash

cd /home/$USER/

echo "Download new gogs version..."
wget "https://dl.gogs.io/gogs_latest_linux_amd64.tar.gz" -O gogs_current.tar.gz

echo "Stopping gogs service..."
svc -d service/gogs

echo "Remove old gogs-backup..."
rm -r gogs-backup

echo "Create new gogs-backup folder..."
mv gogs gogs-backup

echo "Extract new gogs version..."
tar xf gogs_current.tar.gz

echo "Copy data from the old version..."
cp -r gogs-backup/custom gogs/
cp -r gogs-backup/data gogs/

echo "Restart gogs instance..."
svc -du service/gogs

echo "Cleanup..."
rm gogs_current.tar.gz

echo "Done."
