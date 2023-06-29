#!/usr/bin/env bash

function check_path() {
        currentPath=${PWD##*/}
        isCorrectPath=0

        if [ "$currentPath" != "bash_tools" ] && [ -d ".devcontainer" ]; then
                isCorrectPath=1
        fi

        if [ $isCorrectPath -eq 0 ] && [ "$currentPath" == "bash_tools" ]; then
                echo "Changing working directory..."
                cd ../
        fi

        if [ $isCorrectPath -eq 0 ] && [ "$currentPath" != "bash_tools" ]; then
                echo "Error, the script will not be executed: You are not in the correct path to run this script."
                exit
        fi
}

function generateAstroProject() {
    echo -e "\nSe va a generar un nuevo proyecto Astro en $FRONTEND_PATH\n"
    docker run --rm -i -v $FRONTEND_PATH:/app node:current-alpine sh -c "cd /app && npm create astro@latest . -- --install --no-git --skip-houston"
    
    echo -e "\n Changing folder owner to $USER \n"
    sudo chown -R $USER:$USER $FRONTEND_PATH
}

function installDependencies() {
    docker run --rm -v $FRONTEND_PATH:/app node:current-alpine sh -c "cd /app && npm install --loglevel verbose"

    echo -e "\n Changing folder owner to $USER \n"
    sudo chown -R $USER:$USER $FRONTEND_PATH/node_modules
}