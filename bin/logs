#!/bin/bash

####################
###   Binaries   ###
####################
DOCKER_COMPOSE=$(which docker-compose)
####################

PROJECT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

echo "[$(date +"%Y-%m-%d %T")] Showing logs containers..."

while read line; do export "$line";
done < <(cat ${PROJECT_PATH}/.env | grep -v "#" | grep -v "^$")
export USER_ID=${UID}
export GROUP_ID=${UID}

${DOCKER_COMPOSE} \
    -f ${PROJECT_PATH}/deploy/develop/docker-compose.yaml \
    logs -f --tail 40    

