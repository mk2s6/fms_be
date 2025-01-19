@ECHO OFF
SET /P UI_DEPLOY="Do you want to deploy, Please provide y for Yes? "
IF /I "%UI_DEPLOY%" NEQ "y" GOTO ENDING

SET /P UI_RDB="Do you want to recreate DB, Please provide y for Yes? "
echo %UI_RDB% | ssh mk2s.ovh "cd /var/app/fms_be/tools/scripts/deployments && bash ./deploy.sh"
