@ECHO OFF

ECHO "EXPORT DATABASE"
cd ..\\..\\
mysqldump -u root -p --databases mk2s_fms  > .\\migrations\\initialize-base-db.sql
ECHO "EXPORT COMPLETE"


ECHO "GIT COMMIT BACKEND"
git add .
git commit -m "Added more features related to encryption decryptoion"
git push
ECHO "GIT PUSHED BACKEND"

cd ../fms_fe

ECHO "GIT COMMIT FRONT END"
git add .
git commit -m "Added more features related to encryption decryptoion"
git push
ECHO "GIT PUSHED FRONT END"

