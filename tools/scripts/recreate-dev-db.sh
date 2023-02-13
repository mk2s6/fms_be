#!/bin/bash -ue

#Create sql file to cleanup/recreate DB and users
#First line has single > because we want to overwrite existing file.
#Other has >> because they are just appending it.

echo "INITIALIZING DB...."
mysql -u root -p < ../../migrations/initialize-base-db.sql

echo "Importing Schema by running migrations..."
cd ../../
db-migrate up
db-migrate up:data
db-migrate up:tests
#To go to folder where we were earlier
cd tools/scripts

# ECHO "Importing Schema..."
# mysql -u root -p mk2s_hotel < ..\..\tools\db_schema\mk2s_hotel-schema.sql

# ECHO "Importing Test Data..."
# mysql -u root -p mk2s_hotel < ..\..\tools\db_schema\mk2s_hotel-data.sql

echo "Successfully recreated database"
