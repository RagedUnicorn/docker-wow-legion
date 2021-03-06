# docker-wow-legion

> A docker base image to build a container for WoW Legion Server

This image is intended to build a base for running a WoW Legion Server based on the work of Trinity and the AshamaneProject. It uses [ragedunicorn/mysql](https://cloud.docker.com/repository/docker/ragedunicorn/mysql) as a provider for the database.

Its intent is to provide a WoW Server for experimenting and developing WoW Addons.

![](/doc/legion_logo.png)

## Using the image

#### Start container

The container can be easily started with `docker-compose` command.

```
docker-compose up -d
```

#### Stop container

To stop all services from the docker-compose file

```
docker-compose down
```

#### Join a swarm

```
docker swarm init
```

#### Create secrets
```
echo "some_password" | docker secret create com.ragedunicorn.mysql.root_password -
echo "app_user" | docker secret create com.ragedunicorn.mysql.app_user -
echo "app_user_password" | docker secret create com.ragedunicorn.mysql.app_user_password -
```

#### Deploy stack
```
docker stack deploy --compose-file=docker-compose.stack.yml [stackname]
```

For a production deployment a stack should be deployed. Secrets will then be taken into account and both the MySQL container and the WoW container will be setup accordingly.

### Overwriting build args

Using `docker-compose.dev.yml` or `docker-compose.yml` allows for easy overriding of certain build arguments.

```
wow_legion_server:
  build:
    context: .
    args:
      WOW_USER: legion
      WOW_GROUP: legion
      WOW_HOME: /home/legion
      DTOOLS: 1
```

### Create WoW Account

You will have to create an account by yourself. The server service allocates a tty for the mangos console. This allows to attach directly to the mangosd process and its console.

```
docker attach [CONTAINER]

bnetaccount create <user> <pass>
account set gmlevel [$account] #level [#realmid]
```

Note: The username used for setting your gmlevel is not the same as the username you create with bnetaccount. You must manually find the username in auth.account.username. These are formatted as 1#1, 2#1, etc.
Level `#level` may range from 0 to 3. Realmid `#realmid` may be -1 for all realms.

example:
```
bnetaccount create admin@admin admin
account set gmlevel 1#1 3 -1
```

Login to your account:

Log in with email admin@admin and password admin through Wow_Patched.exe or Wow-64_Patched.exe.

## Dockery

In the dockery folder are some scripts that help out avoiding retyping long docker commands but are mostly intended for playing around with the container. For production use docker-compose should be used.

#### Build image

The build script builds an image with a defined name

```
sh dockery/dbuild.sh
```

#### Run container

Runs the built container. If the container was already run once it will `docker start` the already present container instead of using `docker run`

```
sh dockery/drun.sh
```

#### Attach container

Attaching to the container after it is running

```
sh dockery/dattach.sh
```

#### Stop container

Stopping the running container

```
sh dockery/dstop.sh
```

## Configuration

### bnetserver.conf

Configuration for realm is located in config/bnetserver.conf.tpl and copied into the image opt/legion/etc

### worldserver.conf

Configuration for world server is located in config/worldserver.conf.tpl and copied into the image opt/legion/etc

During the startup of the server the templates are rendered and the final configuration is created. This step is repeated each time the docker-entrypoint.sh script is executed. It is important that all modifications are done in the templates itself and not the generated configuration. Those will be overwritten.

Using this information configuration files can be overwritten by mounting different ones into the container. Again it is important that the template files are being used otherwise the configuration will be overwritten after each restart of the container.

In this example the same configurations that are copied into the image are mounted when using docker-compose. In most cases it makes more sense to have a separate configuration somewhere. This makes it easy having different configurations for different servers.

```
volumes:
  - ${PWD}/config/bnetserver.conf.tpl:/opt/legion/etc/bnetserver.conf.tpl
  - ${PWD}/config/worldserver.conf.tpl:/opt/legion/etc/worldserver.conf.tpl
```

## Development

To debug the container and get more insight into the container use the `docker-compose.dev.yml`
configuration.

```
docker-compose -f docker-compose.dev.yml up -d
```

By default the launchscript `/docker-entrypoint.sh` will not be used to start the `worldserver` and `bnetserver` processes. Instead the container will be setup to keep `stdin_open` open and allocating a pseudo `tty`. This allows for connecting to a shell and work on the container. A shell can be opened inside the container with `docker attach [container-id]`. The server itself can be started with `./docker-entrypoint.sh`. Note that this has to be done for the database container first otherwise both `worldserver` and `bnetserver` will not be able to connect to the database.

### Generating Server Files (optional)

This repository does not contain the necessary client files such as `dbc`, `maps`, `mmaps` , `cameras`, `gt` and `vmaps`. Generate this files by following the steps below and then place them in the data folder. The data folder will be added as a local volume to the container.

When building the server from source make sure to include the tools. This can be done with the build arg `DTOOLS` set to `1` (default is `0`).

```bash
  cmake ../ -DCMAKE_INSTALL_PREFIX="${WOW_INSTALL}" -DTOOLS="${DTOOLS}" && \
  make && \
  make install
```

This will create the required tools during the compilation of the server. With make install the binaries are copied to `/opt/legion/bin`. For extracting the data a WoW installation is required. It does not matter in this case whether that installation is for Mac or Windows.

Copy wow client to running docker container. The WoW client is not contained in this repository.

`docker cp [client folder] [container-id]:/home/[user]/`

Then navigate inside your `wow-legion-client` folder.

#### Generate maps, dbc, cameras and gt

```
/opt/legion/bin/mapextractor
```

#### Generate vmaps

```
/opt/legion/bin/vmap4extractor
mkdir vmaps
/opt/legion/bin/vmap4assembler
```

**Note:** If the process of vmap4extractor is interrupted make sure to delete the Buildings folder before rerunning the command

#### Generate mmaps

```
/opt/legion/bin/mmaps_generator
```

*Note:* This will take a long time to generate

#### Add the Generated Data to the Docker Image

Extract the data from the image with `docker cp`

`docker cp <containerId>:/[data-file] [host-path]`

The relevant folders that need to be save are `cameras`, `dbc`, `gt`, `maps`, `mmaps` and `vmaps`.

The data has to be placed inside the data folder in the following way

```
data/dbc
data/maps
data/mmaps
data/vmaps
data/cameras
data/gt
```

All resources will be added as a local docker volume to the container once its up and running.

**Note:** The image expects the data to be fully unpacked. If you packaged your resources in any way make sure to unpack them.

#### Source

Server source:

https://github.com/AshamaneProject/AshamaneCore/releases/tag/ADB_735.10

Database source:

https://github.com/AshamaneProject/AshamaneCore/releases/tag/ADB_735.10

#### Misc

The server service keeps `stdin_open` open and allocates a pseudo `tty` for the server process startup successfully. The reason for this is that the server process provides a cli for sending commands to the server. If this cli cannot be started the whole process fails. Not allocating a `tty` and keeping `stdin_open` prevents the process from launching that cli.

## Test

To do basic tests of the structure of the container use the `docker-compose.test.yml` file.

`docker-compose -f docker-compose.test.yml up`

For more info see [container-test](https://github.com/RagedUnicorn/docker-container-test).

Tests can also be run by category such as metadata tests by starting single services in `docker-compose.test.yml`

```
# metadata tests
docker-compose -f docker-compose.test.yml up container-test-metadata
```

The same tests are also available for the development image.

```
# metadata tests
docker-compose -f docker-compose.test.yml up container-dev-test-metadata
```

## Know Issues

#### Make Fails to Link

If make is successful in building the server but fails at the linker step it is highly likely that you encountered a not enoug virtual memory error.

Adding NVERVOSE=1 to the make command can give you more information about the exact error. Usually in this case the error will be 254

```
RUN \
  cmake ../ -DCMAKE_INSTALL_PREFIX="${WOW_INSTALL}" -DTOOLS="${DTOOLS}" && \
  make NVERBOSE=1 && \
  make install
```

Restarting docker or even the whole machine/server can help circumvent this issue.

#### Data Folder is Empty Inside Running Container

If the data folder inside the running container is empty even though the client data is placed correctly there might be an issue with sharing the folder itself. For Windows see [Volume-Sharing](./doc/VOLUME_SHARING.md) for an example on how volumes can be shared if this is blocked by a Firewall.

#### Can't Connect to the Server

There are a lot of reasons why the connection to the server might not work.

###### Localhost vs 127.0.0.1

When updating the configuration inside `WTF\Config.wtf` make sure to use an actual ip-address and not localhost for the `portal` entry.

```
SET portal "127.0.0.1"
```

###### Check bnetserver.conf

Verify that bnetserver.conf has the correct ip-address configured as external access.

```
cat /opt/legion/etc/bnetserver.conf | more
```

Search for `LoginREST.ExternalAddress` and check if this matches the expected value. If not make sure to update the template file(`bnetserver.conf.tpl`) and not the actual configuration then restart the server. During the startup the configuration will be recreated and thus overwrite any changes made to that file.

###### Check realmlist

Verify that the realmlist table is configured properly.

```
# connect to mysql from within the wow container
mysql -uapp -p -hwow-legion-database

mysql> USE auth;
mysql> SELECT * FROM realmlist;
```

The entry for the `ragedunicorn` realm should have the same ip-adress configured as the entry in `bnetserver.conf`

**Note:** The server is initialized based on the following file:

```
/home/wow/server/sql/base/auth_database.sql.tpl
```

Both `${realm_name}` and `${public_ip}` are replaced with actual values.


## Links

Ubuntu packages database
- http://packages.ubuntu.com/

## License

Copyright (C) 2019 Michael Wiesendanger

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
