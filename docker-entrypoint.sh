#!/bin/bash
# @author Michael Wiesendanger <michael.wiesendanger@gmail.com>
# @description launch script for wow_legion_server

set -euo pipefail

WD="${PWD}"

# get secrets from database container
mysql_app_user="/run/secrets/com.ragedunicorn.mysql.app_user"
mysql_app_password="/run/secrets/com.ragedunicorn.mysql.app_user_password"
database_hostname="${DATABASE_HOSTNAME:?localhost}"
database_port="3306"

function check_mysql_status {
  i=0

  while ! nc "${database_hostname}" "${database_port}" >/dev/null 2>&1; do
    i=$((i + 1))
    if [ "${i}" -ge 50 ]; then
      echo "$(date) [ERROR]: Mysql-Service not reachable aborting..."
      exit 1
    fi
    echo "$(date) [INFO]: Waiting for TCP connection to ${database_hostname}:${database_port}..."
    sleep 5
  done
  echo "$(date) [INFO]: Mysql connection established"
}

function create_log_dir {
  echo "$(date) [INFO]: Creating log directory ${WOW_LOG_DIR} and setting permissions"
  mkdir -p "${WOW_LOG_DIR}"
  chown -R "${WOW_USER}":"${WOW_GROUP}" "${WOW_LOG_DIR}"
}

# setup mangos database
function prepare_database {
  echo "$(date) [INFO]: Launching initial database setup ..."
  echo "$(date) [INFO]: Creating databases"
  # create databases
  mysql -u"${mysql_app_user}" -p"${mysql_app_password}" -h "${database_hostname}" < "${WOW_HOME}"/server/sql/create/create_mysql.sql
  echo "$(date) [INFO]: Setup characters database"

  # move sql files to binary location - they will be automatically applied on startup
  mv "${WOW_HOME}"/*.sql "${WOW_INSTALL}/bin"

  echo "$(date) [INFO]: Database setup done"
}

# if one of the databases is missing we assume a fresh setup
function check_database_setup {
  databases=("world" "characters" "auth" "hotfixes")

  for i in "${databases[@]}"; do
    if ! mysql -u"${mysql_app_user}" -p"${mysql_app_password}" -h "${database_hostname}" -e "USE ${i}" > /dev/null 2>&1; then
      prepare_database
      break
    fi
  done
}

function setup_configuration {
  if [ -f "${mysql_app_user}" ] && [ -f "${mysql_app_password}" ]; then
    echo "$(date) [INFO]: Found docker secrets - using secrets to setup configuration"

    mysql_app_user="$(cat ${mysql_app_user})"
    mysql_app_password="$(cat ${mysql_app_password})"
  else
    echo "$(date) [INFO]: No docker secrets found - using environment variables"

    mysql_app_user="${MYSQL_APP_USER:?Missing environment variable MYSQL_APP_USER}"
    mysql_app_password="${MYSQL_APP_PASSWORD:?Missing environment variable MYSQL_APP_PASSWORD}"
  fi

  sed \
    -e "s/\${wow_database_user}/${mysql_app_user}/" \
    -e "s/\${wow_database_user_password}/${mysql_app_password}/" \
    -e "s/\${database_hostname}/${database_hostname}/" \
    "${WOW_INSTALL}/etc/worldserver.conf.tpl" | tee "${WOW_INSTALL}/etc/worldserver.conf"

  sed \
    -e "s/\${wow_database_user}/${mysql_app_user}/" \
    -e "s/\${wow_database_user_password}/${mysql_app_password}/" \
    -e "s/\${database_hostname}/${database_hostname}/" \
    "${WOW_INSTALL}/etc/bnetserver.conf.tpl" | tee "${WOW_INSTALL}/etc/bnetserver.conf"

  echo "$(date) [INFO]: Finished setup for worldserver and bnetserver"
}

function launch_server {
  echo "$(date) - Launching bnetserver"
  # start realm in background
  cd "${WOW_INSTALL}"/bin
  exec gosu "${WOW_USER}" ./bnetserver &
  echo "$(date) - Launching worldserver"
  # start world in foreground preventing docker container from exiting
  exec gosu "${WOW_USER}" ./worldserver
}

function init {
  setup_configuration
  create_log_dir
  check_mysql_status
  check_database_setup
  launch_server
}

init
