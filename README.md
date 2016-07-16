[![Go Report](https://goreportcard.com/badge/github.com/zyfdegh/unqlite-crud)](https://goreportcard.com/report/github.com/zyfdegh/unqlite-crud)

# unqlite-crud
![Golang Unqlite](https://raw.githubusercontent.com/zyfdegh/unqlite-crud/master/raw/golang-unqlite.png)

unqlite-crud is a golang example on how to use binder add, update, query and delete data in UnQLite.
The UnQLite binder for golang used in this project is [svkior/unqlitego](github.com/svkior/unqlitego) .

# What's UnQLite
[UnQLite](https://unqlite.org/) is a in-process software library which implements a self-contained, 
serverless, zero-configuration, transactional NoSQL database engine.

# Get UnQLite

## Docker
If you are familar with Docker, I recommend you to run unqlite-crud in Docker container, 
it will save a lot effort and time comparing to building UnQLite from source codes.
Docker image [zyfdedh/unqlite](hub.docker.com/zyfdedh/unqlite) is available on Docker Hub.
Pull it by

```sh
docker pull zyfdedh/unqlite
```
Nevermind, the image tagged latest(based on alpine) is as small as 5.41MB.
Dockerfile is also opensourced on github [zyfdegh/dockerfile-unqlite](https://github.com/zyfdegh/dockerfile-unqlite)

## Build from source
You can build UnQLite from scratch. UnQLite is written in C and you need a C compiler like GCC.
Source codes is hosted on github [symisc/unqlite](https://github.com/symisc/unqlite)

```sh
wget -c http://unqlite.org/db/unqlite-db-116.zip

unzip unqlite-db-116.zip

gcc -Wall -fPIC -c *.c

gcc -shared -Wl,-soname,libunqlite.so.1 -o libunqlite.so.1.0 *.o

sudo cp `pwd`/libunqlite.so.1.0 /usr/local/lib/
sudo cp `pwd`/unqlite.h /usr/local/include/
sudo ln -sf /usr/local/lib/libunqlite.so.1.0 /usr/local/lib/libunqlite.so.1
sudo ln -sf /usr/local/lib/libunqlite.so.1 /usr/local/lib/libunqlite.so

ldconfig /usr/local/lib/libunqlite.so
```

# Run unqlite-crud in container
> 1.Clone

```sh
git clone https://github.com/zyfdegh/unqlite-crud.git
```

> 2.Build

```sh
./build.sh
```

> 3.Start a container

Similar to SQLite, UnQLite need not to start a daemon process, no port listenning, and no configurations.
So you need to add command `sh` at last when starting a new container, otherwise the container will exit after created.

```sh
docker run -it zyfdedh/unqlite sh
```

> 4.Copy binary to container

Open a new console, first query unqlite container ID, like 16216318adc2

```sh
docker ps | grep unqlite
```

cd project home , and copy unqlite-crud to container

```sh
docker cp unqlite-crud 16216318adc2:/root/unqlite-crud
```

> 5.Run
In the previous shell, run

```sh
cd ~ && ./unqlite-crud
```

# Run unqlite-crud on host
If you choose to build unqlite from source and have already installed it on your machine.Run it directly.

> 1.Clone

```sh
git clone https://github.com/zyfdegh/unqlite-crud.git
```

> 2.Build

```sh
./build.sh
```
> 3.Run
Run the binary under bin

```sh
./bin/unqlite-crud
```

# Screenshot

![unqlite-crud-screenshot](https://raw.githubusercontent.com/zyfdegh/unqlite-crud/master/raw/screenshot-01.png)