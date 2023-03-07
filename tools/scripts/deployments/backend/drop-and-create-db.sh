
echo "DROPPING DB...."
mysql -u root -p < ./drop-db.sql
echo "DROPPING DB COMPLETE...."

echo "INITIALIZING DB...."
mysql -u root -p < /var/app/fms_be/migrations/initialize-base-db.sql
echo "INITIALIZED DB...."
