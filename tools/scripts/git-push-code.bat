@REM @ECHO OFF

ECHO "EXPORT DATABASE"
cd ..\\..\\
mysqldump -u root -pkusumanjali21 mk2s_fms  > .\\migrations\\initialize-base-db.sql
ECHO "EXPORT COMPLETE"


ECHO "GIT COMMIT BACKEND"
git add .
git commit -m "Added more features"
git push
ECHO "GIT PUSHED BACKEND"


ECHO "GIT COMMIT FRONT-END"
cd ../fms_fe

git add .
git commit -m "Added more features"
git push
ECHO "GIT PUSHED FRONT-END"