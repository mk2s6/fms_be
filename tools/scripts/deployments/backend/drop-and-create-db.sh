
echo "DROPPING DB...."
mysql -u root -p 2110059798 < ./drop-db.sql
echo "DROPPING DB COMPLETE...."

echo "INITIALIZING DB...."
mysql -u root -p 2110059798 < /var/app/fms_be/migrations/initialize-base-db.sql
echo "INITIALIZED DB...."
