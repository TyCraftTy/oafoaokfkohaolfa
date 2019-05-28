#!/bin/sh

echo "OAUTH_ACCESS_TOKEN=$DROPBOX_API_TOKEN" > /app/.dropbox_uploader
echo "!----- DOWNLOADING USERS... "
./dropbox download /acayrin/users /app/panel/data
echo "!----- DOWNLOADING SERVER FILES... "
mkdir server
./dropbox download /acayrin/server/backup.zip
unzip backup.zip
rm backup.zip
chmod -R 777 server
echo "-----> Starting system.backup..."
screen -S system.backup -dm bash -c "while true; do ./uploader; sleep 600; done"
echo "!----- STARTING UP SERVER(s) ..."
./dropbox download /acayrin/run.startup
chmod 777 run.startup
echo "-----> Starting server...
./run.startup
