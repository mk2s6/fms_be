@ECHO OFF
setlocal

SET /P UI_DB_EXPORT="Do you want to export complete DB? : "
IF /I "%UI_DB_EXPORT%" NEQ "y" GOTO COMMIT

:EXPORT_DB
ECHO "EXPORT DATABASE"
cd ..\\..\\
mysqldump -u root -p --databases mk2s_fms  > .\\migrations\\initialize-base-db.sql
ECHO "EXPORT COMPLETE"

:COMMIT
ECHO Do you want to push frontend and backend ?
ECHO Please enter A for both, B for only Back-End and F for Front-End only :
SET /P UIC_REPO_PUSH="A/a = all, B/b = Backend only, F/f = Front-End only :"
SET /P USER_COMMIT_MESSAGE="What do you want the commit message to be? : "

ECHO Committing with message: "%USER_COMMIT_MESSAGE%"

IF /I "%USER_COMMIT_MESSAGE%" EQU "" (
    ECHO Commit message cannot be empty. Please try again.
    GOTO COMMIT
)

IF /I "%UIC_REPO_PUSH%" EQU "A" GOTO ALL
IF /I "%UIC_REPO_PUSH%" EQU "B" GOTO BE
IF /I "%UIC_REPO_PUSH%" EQU "F" GOTO FE


:ALL
:BE
ECHO "GIT COMMIT BACKEND"
git add .
git commit -m "%USER_COMMIT_MESSAGE%"
git push
ECHO "GIT PUSHED BACKEND"
IF /I "%UIC_REPO_PUSH%" EQU "b" GOTO ENDING


:FE
cd ../fms_fe
ECHO "GIT COMMIT FRONT END"
git add .
git commit -m "%USER_COMMIT_MESSAGE%"
git push
ECHO "GIT PUSHED FRONT END"

:ENDING
SET /P UI_DEPLOY="Do you want to deploy, Please provide y for Yes? "
IF /I "%UI_DEPLOY%" NEQ "y" GOTO ENDING

SET /P UI_RDB="Do you want to recreate DB, Please provide y for Yes? "
ECHO %UI_RDB% | ssh mk2s.ovh "bash -c 'cd /var/app/fms_be/tools/scripts/deployments && bash ./deploy.sh '"

ECHO Completed batch script, ending session;
endlocal