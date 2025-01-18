@ECHO OFF
setlocal

SET /p UDB = "Do you want to export complete DB? : "
IF /i "%UDB%" EQU "y" GOTO EXPORT_DB
GOTO COMMIT

:EXPORT_DB
ECHO "EXPORT DATABASE"
cd ..\\..\\
mysqldump -u root -p --databases mk2s_fms  > .\\migrations\\initialize-base-db.sql
ECHO "EXPORT COMPLETE"

:COMMIT
ECHO "Do you want to push frontend and backend ?"
ECHO "Please enter A for both, B for only Back-End and F for Front-End only :"
SET /p UIC_REPO_PUSH="A/a = all, B/b = Backend only, F/f = Front-End only :"
SET /p USER_COMMIT_MESSAGE="What do you want the commit message to be? : "

ECHO Committing with message: "%USER_COMMIT_MESSAGE%"

IF /i "%USER_COMMIT_MESSAGE%" EQU "" (
    ECHO Commit message cannot be empty. Please try again.
    GOTO COMMIT
)

IF /i %UIC_REPO_PUSH% EQU "A" GOTO ALL
IF /i %UIC_REPO_PUSH% EQU "B" GOTO BE
IF /i %UIC_REPO_PUSH% EQU "F" GOTO FE


:ALL
:BE
ECHO "GIT COMMIT BACKEND"
git add .
git commit -m "%USER_COMMIT_MESSAGE%"
git push
ECHO "GIT PUSHED BACKEND"
IF /i %UIC_REPO_PUSH% NEQ "A" OR %UIC_REPO_PUSH% NEQ "a" GOTO END


:FE
cd ../fms_fe
ECHO "GIT COMMIT FRONT END"
git add .
git commit -m "%USER_COMMIT_MESSAGE%"
git push
ECHO "GIT PUSHED FRONT END"

:END
ECHO Completed batch script, ending session;
endlocal