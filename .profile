#!/bin/sh

echo "OAUTH_ACCESS_TOKEN=$DROPBOX_API_TOKEN" > /app/.dropbox_uploader
screen -dmS system.start /app/start
