#!/bin/bash

cd /var/app/fms_be/

echo "Pulling code from GIT ..."
git stash
git pull
git stash pop
echo "Pulling code from GIT Successful..."

echo "Do you want to Recreate-DB, If yes please give Y/y else please provide any key? - "
read -p "" recreate
recreate=${recreate:-$1}
recreate=$(echo "$recreate" | tr -d '\n')
recreate=$(echo "$recreate" | tr -d '\r')

echo Recreate options : "$recreate"
echo "Recreate options (debug):"
echo "$recreate" | od -c

if [[ "$recreate" =~ ^[Yy] ]]; then
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

echo "Server restarted..."
