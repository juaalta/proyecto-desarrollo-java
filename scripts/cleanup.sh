#!/bin/bash

####################
###   Binaries   ###
####################
DOCKER=$(which docker)
####################

PROJECT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
PROJECT_NAME="$(cd $PROJECT_PATH && ./scripts/app_name.sh)"

echo "[$(date +"%Y-%m-%d %T")] Stopping and removing all the containers..."
# echo $PROJECT_PATH
# echo $PWD
# echo $HOME
# echo $PROJECT_NAME

${DOCKER} stop $(${DOCKER} ps -a -q) && ${DOCKER} rm $(${DOCKER} ps -a -q) --volumes

