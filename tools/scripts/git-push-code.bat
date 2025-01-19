@ECHO OFF
setlocal

SET /p UI_DB_EXPORT="Do you want to export complete DB? : "
IF /i "%UI_DB_EXPORT%" NEQ "y" GOTO COMMIT

:EXPORT_DB
ECHO "EXPORT DATABASE"
cd ..\\..\\
mysqldump -u root -p --databases mk2s_fms  > .\\migrations\\initialize-base-db.sql
ECHO "EXPORT COMPLETE"

:COMMIT
ECHO Do you want to push frontend and backend ?
ECHO Please enter A for both, B for only Back-End and F for Front-End only :
SET /p UIC_REPO_PUSH="A/a = all, B/b = Backend only, F/f = Front-End only :"
SET /p USER_COMMIT_MESSAGE="What do you want the commit message to be? : "

ECHO Committing with message: "%USER_COMMIT_MESSAGE%"

IF /i "%USER_COMMIT_MESSAGE%" EQU "" (
    ECHO Commit message cannot be empty. Please try again.
    GOTO COMMIT
)

IF /i "%UIC_REPO_PUSH%" EQU "A" GOTO ALL
IF /i "%UIC_REPO_PUSH%" EQU "B" GOTO BE
IF /i "%UIC_REPO_PUSH%" EQU "F" GOTO FE


:ALL
:BE
ECHO "GIT COMMIT BACKEND"
git add .
git commit -m "%USER_COMMIT_MESSAGE%"
git push
ECHO "GIT PUSHED BACKEND"
IF /i "%UIC_REPO_PUSH%" EQU "b" GOTO ENDING


:FE
cd ../fms_fe
ECHO "GIT COMMIT FRONT END"
git add .
git commit -m "%USER_COMMIT_MESSAGE%"
git push
ECHO "GIT PUSHED FRONT END"

SET /p UI_DEPLOY="Do you want to deploy, Please provide y for Yes? "
IF /i "%UI_DEPLOY%" NEQ "y" GOTO ENDING

ssh mk2s.ovh "cd /var/app/fms_be/tools/scripts/deployments && bash ./deploy.sh"

:ENDING
ECHO Completed batch script, ending session;
endlocal