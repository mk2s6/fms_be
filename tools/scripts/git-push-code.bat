@ECHO OFF

SET /p db_export = "Do you want to export complete DB? : "
IF /i "%db_export%" == "y" OR "%db_export%" == "Y" GOTO EXPORT_DB
GOTO COMMIT

:EXPORT_DB
ECHO "EXPORT DATABASE"
cd ..\\..\\
mysqldump -u root -p --databases mk2s_fms  > .\\migrations\\initialize-base-db.sql
ECHO "EXPORT COMPLETE"


:COMMIT
SET /p commit_message="What do you want the commit message to be? : "
ECHO "commit message "
/i echo Committing with message: "%commit_message%"
if "%commit_message%"=="" (
    echo Commit message cannot be empty. Please try again.
    goto end
)



ECHO "GIT COMMIT BACKEND"
git add .
git commit -m "%commit_message%"
git push
ECHO "GIT PUSHED BACKEND"

cd ../fms_fe

ECHO "GIT COMMIT FRONT END"
git add .
git commit -m "%commit_message%"
git push
ECHO "GIT PUSHED FRONT END"

:end