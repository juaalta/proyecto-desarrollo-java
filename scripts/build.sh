#!/bin/bash

####################
###   Binaries   ###
####################
DOCKER=$(which docker)
####################

PROJECT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

echo "[$(date +"%Y-%m-%d %T")] Building source"
# echo $PROJECT_PATH
# echo $PWD
# echo $HOME

${DOCKER} run -it --rm --name my-maven-project -v "$PWD"/.:/usr/src/app -v "$HOME"/.m2:/root/.m2 -w /usr/src/app maven:3.6.3-jdk-11 mvn clean install