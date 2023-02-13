@ECHO OFF

REM Create sql file to cleanup/recreate DB and users
REM First line has single > because we want to overwrite existing file.
REM Other has >> because they are just appending it.

mysql -u root -p < ../../migrations/initialize-base-db.sql

ECHO "Importing Schema by running migrations..."
cd ../../
call db-migrate up
call db-migrate up:data
call db-migrate up:tests
REM To go to folder where we were earlier
cd tools/scripts

REM ECHO "Importing Schema..."
REM mysql -u root -p mk2s_hotel < ..\..\tools\db_schema\mk2s_hotel-schema.sql

REM ECHO "Importing Test Data..."
REM mysql -u root -p mk2s_hotel < ..\..\tools\db_schema\mk2s_hotel-data.sql

ECHO "Successfully recreated database"
