#!/bin/bash
# @author Michael Wiesendanger <michael.wiesendanger@gmail.com>
# @description build script for docker-wow-legion-server container

set -euo pipefail

WD="${PWD}"

# variable setup
DOCKER_WOW_LEGION_SERVER_TAG="ragedunicorn/wow-legion-server"
DOCKER_WOW_LEGION_SERVER_NAME="wow-legion-server"

# get absolute path to script and change context to script folder
SCRIPTPATH="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
cd "${SCRIPTPATH}"

echo "$(date) [INFO]: Building container: ${DOCKER_WOW_LEGION_SERVER_NAME}"

# build wow_legion_server container
docker build -t "${DOCKER_WOW_LEGION_SERVER_TAG}" ../

cd "${WD}"
