#!/bin/bash

####################
###   Binaries   ###
####################
DOCKER=$(which docker)
####################

PROJECT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
PROJECT_NAME="$(cd $PROJECT_PATH && ./scripts/app_name.sh)"

echo "[$(date +"%Y-%m-%d %T")] Executing the mvn command: $1"
# echo $PROJECT_PATH
# echo $PWD
# echo $HOME
# echo $PROJECT_NAME

${DOCKER} run -it --rm --name $PROJECT_NAME -v "$PWD"/.:/usr/src/app -v "$HOME"/.m2:/root/.m2 -w /usr/src/app maven:3.6.3-jdk-11 mvn $1
