
echo "DROPPING DB...."
mysql -u root -p < ./drop-db.sql
echo "DROPPING DB COMPLETE...."

echo "INITIALIZING DB...."
mysql -u root -p < ../../migrations/initialize-base-db.sql
echo "INITIALIZED DB...."
