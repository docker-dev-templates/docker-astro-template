#!/usr/bin/env bash

if [ -d ".devcontainer" ]; then
	source ./bash_tools/functions.sh
else
	source functions.sh
fi

check_path

source .devcontainer/.env

FOLDER_NAME=${PROJECT_NAME}_frontend
FRONTEND_PATH=${PWD}/${FOLDER_NAME}

if [ -d "$FRONTEND_PATH" ]; then
    installDependencies
else
	echo -e "\n❌ Advertencia: No existe un directorio llamado $FOLDER_NAME.\n No se instalarán las dependencias de NPM.\n"
fi