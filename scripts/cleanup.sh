#!/bin/bash

####################
###   Binaries   ###
####################
DOCKER=$(which docker)
####################

PROJECT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

echo "[$(date +"%Y-%m-%d %T")] Stopping and removing all the containers..."
# echo $PROJECT_PATH
# echo $PWD
# echo $HOME

${DOCKER} stop $(${DOCKER} ps -a -q) && ${DOCKER} rm $(${DOCKER} ps -a -q) --volumes

