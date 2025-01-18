@ECHO OFF

REM We are using migrations hence we will not be dumping schema. Schema will be created through migrations.
REM Same things applied for test data also. Use "recreate-dev-db.bat" to create database for development.

ECHO "Dumping Schema..."
mysqldump -u root -p --no-data mk2s_fms | sed 's/ AUTO_INCREMENT=[0-9]*//g' > ..\..\tools\scripts\mk2s_fms-schema.sql

ECHO "Dumping Data..."
mysqldump -u root -p --no-create-info mk2s_fms > ..\..\tools\scripts\mk2s_fms-data.sql

REM ECHO "Successfully dumped database"
