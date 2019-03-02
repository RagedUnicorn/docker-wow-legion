FROM ubuntu:bionic

LABEL com.ragedunicorn.maintainer="Michael Wiesendanger <michael.wiesendanger@gmail.com>"

#     __    ____________________  _   __   _____ __________ _    ____________
#    / /   / ____/ ____/  _/ __ \/ | / /  / ___// ____/ __ \ |  / / ____/ __ \
#   / /   / __/ / / __ / // / / /  |/ /   \__ \/ __/ / /_/ / | / / __/ / /_/ /
#  / /___/ /___/ /_/ // // /_/ / /|  /   ___/ / /___/ _, _/| |/ / /___/ _, _/
# /_____/_____/\____/___/\____/_/ |_/   /____/_____/_/ |_| |___/_____/_/ |_|

# software versions
ENV \
  WGET_VERSION=1.19.4-1ubuntu2.1 \
  CA_CERTIFICATES_VERSION=20180409 \
  DIRMNGR_VERSION=2.2.4-1ubuntu1.2 \
  GOSU_VERSION=1.10 \
  GPG_VERSION=2.2.4-1ubuntu1.2 \
  GPG_AGENT_VERSION=2.2.4-1ubuntu1.2 \
  GPG_CONF_VERSION=2.2.4-1ubuntu1.2 \
  MAKE_VERSION=4.1-9.1ubuntu1 \
  CMAKE_VERSION=3.10.2-1ubuntu2 \
  GCC_VERSION=4:7.3.0-3ubuntu2 \
  CLANG_VERSION=1:6.0-41~exp4 \
  GPLUSPLUS_VERSION=4:7.3.0-3ubuntu2 \
  MYSQL_CLIENT_VERSION=5.7.25-0ubuntu0.18.04.2 \
  LIBSSL_DEV_VERSION=1.1.0g-2ubuntu4.3 \
  LIBBZ_2_DEV_VERSION=1.0.6-8.1 \
  GIT_VERSION=1:2.17.1-1ubuntu0.4 \
  LIB_MYSQL_DB_CLIENT_VERSION=5.7.25-0ubuntu0.18.04.2  \
  LIB_READLINE_VERSION=7.0-3 \
  LIBBOOST_ALL_DEV_VERSION=1.65.1.0ubuntu1 \
  LIBNCURSES5_DEV_VERSION=6.1-1ubuntu1.18.04 \
  NANO_VERSION=2.9.3-2 \
  NETCAT_VERSION=1.10-41.1

# image args
ARG WOW_USER=wow
ARG WOW_GROUP=wow
ARG WOW_INSTALL=/opt/legion
ARG WOW_HOME=/home/wow

# build extractory for extracting client data
# 0 - false, 1 - true
ARG DTOOLS=0

ENV \
  WOW_USER="${WOW_USER}" \
  WOW_GROUP="${WOW_GROUP}" \
  WOW_INSTALL="${WOW_INSTALL}" \
  WOW_LOG_DIR="/var/log/wow" \
  WOW_HOME="${WOW_HOME}" \
  PUBLIC_IP="127.0.0.1" \
  REALM_NAME="ragedunicorn" \
  GOSU_GPGKEY="B42F6819007F00F88E364FD4036A9C25BF357DD4"

RUN groupadd -g 9999 -r "${WOW_USER}" && useradd -u 9999 -r -g "${WOW_GROUP}" "${WOW_USER}"

RUN \
  set -ex; \
  apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates="${CA_CERTIFICATES_VERSION}" \
    wget="${WGET_VERSION}" \
    gpg="${GPG_VERSION}" \
    gpg-agent="${GPG_AGENT_VERSION}" \
    gpgconf="${GPG_CONF_VERSION}" \
    dirmngr="${DIRMNGR_VERSION}" \
    nano="${NANO_VERSION}" && \
  dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" && \
  if ! wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-${dpkgArch}"; then \
    echo >&2 "Error: Failed to download Gosu binary for '${dpkgArch}'"; \
    exit 1; \
  fi && \
  if ! wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-${dpkgArch}.asc"; then \
    echo >&2 "Error: Failed to download transport armor file for Gosu - '${dpkgArch}'"; \
    exit 1; \
  fi && \
  export GNUPGHOME && \
  GNUPGHOME="$(mktemp -d)" && \
  for server in \
    hkp://p80.pool.sks-keyservers.net:80 \
    hkp://keyserver.ubuntu.com:80 \
    hkp://pgp.mit.edu:80 \
  ;do \
    echo "Fetching GPG key ${GOSU_GPGKEY} from $server"; \
    gpg --keyserver "$server" --recv-keys "${GOSU_GPGKEY}" && found=yes && break; \
  done && \
  gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu && \
  rm -rf "${GNUPGHOME}" /usr/local/bin/gosu.asc && \
  chmod +x /usr/local/bin/gosu && \
  gosu nobody true && \
  apt-get purge -y --auto-remove ca-certificates wget gpg gpg-agent dirmngr && \
  rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
  git="${GIT_VERSION}" \
  clang="${CLANG_VERSION}" \
  cmake="${CMAKE_VERSION}" \
  make="${MAKE_VERSION}" \
  gcc="${GCC_VERSION}" \
  g++="${GPLUSPLUS_VERSION}" \
  libmysqlclient-dev="${LIB_MYSQL_DB_CLIENT_VERSION}" \
  mysql-client="${MYSQL_CLIENT_VERSION}" \
  libssl-dev="${LIBSSL_DEV_VERSION}" \
  libbz2-dev="${LIBBZ_2_DEV_VERSION}" \
  libreadline-dev="${LIB_READLINE_VERSION}" \
  netcat="${NETCAT_VERSION}" \
  libncurses5-dev="${LIBNCURSES5_DEV_VERSION}" \
  libboost-all-dev="${LIBBOOST_ALL_DEV_VERSION}" && \
  update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100 && \
  update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang 100

RUN mkdir "${WOW_INSTALL}" \
  && chown "${WOW_USER}":"${WOW_GROUP}" "${WOW_INSTALL}"

# build server
COPY data/server/server.tar.gz.* "${WOW_HOME}"/
RUN mkdir -p "${WOW_HOME}"/server/build

RUN \
  set -ex && \
  cat "${WOW_HOME}"/server.tar.gz.* > "${WOW_HOME}"/server.tar.gz && \
  tar xvzf "${WOW_HOME}"/server.tar.gz -C "${WOW_HOME}"/server && \
  rm -rf "${WOW_HOME}"/server.tar.gz && \
  rm -rf "${WOW_HOME}"/server.tar.gz.*

WORKDIR "${WOW_HOME}"/server/build

RUN \
  cmake ../ -DCMAKE_INSTALL_PREFIX="${WOW_INSTALL}" -DTOOLS="${DTOOLS}" && \
  make && \
  make install

COPY data/sql/sql.tar.gz "${WOW_INSTALL}"/data/

RUN \
  set -ex && \
  tar xvzf "${WOW_INSTALL}"/data/sql.tar.gz && \
  rm -rf "${WOW_INSTALL}"/data/sql.tar.gz

COPY config/bnetserver.conf.tpl config/worldserver.conf.tpl "${WOW_INSTALL}/etc/"

WORKDIR /

# add healthcheck script
COPY docker-healthcheck.sh /

# add launch script
COPY docker-entrypoint.sh /

RUN \
  chmod 755 /docker-entrypoint.sh && \
  chmod 755 /docker-healthcheck.sh

EXPOSE 8081 8085 8086 1119

VOLUME ["${WOW_LOG_DIR}"]

ENTRYPOINT ["/docker-entrypoint.sh"]
