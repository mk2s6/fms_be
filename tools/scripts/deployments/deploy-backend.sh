#!/bin/bash

cd /var/app/fms_be/

echo "Pulling code from GIT ..."
git pull

echo "Pulling code from GIT Successful..."


read -p "Do you want to Recreate-DB, If yes please give Y/y else please provide any key? - " recerate

if [ $recreate -eq "Y" -o $recreate -eq "y"]:
then
echo "Recreating database"
cd /var/app/fms_be/tools/scripts/deplyments/
bash ./drop-and-create-db.sh
fi

cd /var/app/fms_be/

echo "Running Migrations..."

db-migrate up
db-migrate up:data
db-migrate up:tests

echo "Running Migrations successful..."

echo "Restarting server..."
pm2 start ~/pm2.config.js
echo "Server restarted..."
