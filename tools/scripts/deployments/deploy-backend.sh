#!/bin/bash

cd /var/app/fms_be/

echo "Pulling code from GIT ..."
git pull

echo "Pulling code from GIT Successful..."


read -p "Do you want to Recreate-DB, If yes please give Y/y else please provide any key? - " recreate

echo "$recreate-"

if [ "$recreate" = "Y" ] || [ "$recreate" = "y" ]
then
    echo "Recreating database"
    cd /var/app/fms_be/tools/scripts/deployments/
    bash ./drop-and-create-db.sh
fi

cd /var/app/fms_be/

echo "Running Migrations..."

db-migrate up -e dev
db-migrate up:data -e dev
db-migrate up:tests -e dev

echo "Running Migrations successful..."

echo "Restarting server..."
pm2 start ~/pm2.config.js
echo "Server restarted..."
