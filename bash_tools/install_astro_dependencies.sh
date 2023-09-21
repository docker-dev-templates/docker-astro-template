#!/usr/bin/env bash

if [ -d ".devcontainer" ]; then
	source ./bash_tools/functions.sh
else
	source functions.sh
fi

check_path

source .devcontainer/.env

WEBAPP_FOLDER_NAME=${PROJECT_NAME}
WEBAPP_PATH=${PWD}/${WEBAPP_FOLDER_NAME}

if [ -d "$WEBAPP_PATH" ]; then
    installDependencies
else
	echo -e "\n❌ Advertencia: No existe un directorio llamado $WEBAPP_FOLDER_NAME.\n No se instalarán las dependencias de NPM.\n"
fi