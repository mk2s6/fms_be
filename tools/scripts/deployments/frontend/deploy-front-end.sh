#!/bin/bash

cd /var/app/fms_fe/

echo "Pulling code from GIT ..."
git stash
git pull
echo "Pulling code from GIT Successful..."

echo "Running BUILD..."
npm run build
echo "Running BUILD complete..."

sudo systemctl restart nginx
