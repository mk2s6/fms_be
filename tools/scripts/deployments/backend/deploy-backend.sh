#!/bin/bash

cd /var/app/fms_be/

echo "Pulling code from GIT ..."
git stash
git pull
git stash pop
echo "Pulling code from GIT Successful..."


read -p "Do you want to Recreate-DB, If yes please give Y/y else please provide any key? - " recreate

if [ "$recreate" = "Y" ] || [ "$recreate" = "y" ]
then
    echo "Recreating database started"
    cd /var/app/fms_be/tools/scripts/deployments/backend
    bash drop-and-create-db.sh
    echo "Recreating database completed"
fi

cd /var/app/fms_be/

echo "Running Migrations..."

db-migrate up
db-migrate up:data
db-migrate up:tests

echo "Running Migrations successful..."

echo "Restarting server..."
npm i --production
pm2 start ~/pm2.config.js
echo "Server restarted..."
