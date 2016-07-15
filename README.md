[![Go Report](https://goreportcard.com/badge/github.com/zyfdegh/unqlite-crud)](https://goreportcard.com/report/github.com/zyfdegh/unqlite-crud)

# unqlite-crud
![Golang Unqlite](https://raw.githubusercontent.com/zyfdegh/unqlite-crud/master/raw/golang-unqlite.png)

unqlite-crud is a golang example on how to add, update, query and delete data in UnQLite.
It uses the binder [svkior/unqlitego](github.com/svkior/unqlitego) to interact with UnQLite.

# About UnQLite
[UnQLite](https://unqlite.org/) is a in-process software library which implements a self-contained, 
serverless, zero-configuration, transactional NoSQL database engine.

# Install UnQLite

## Docker of course!
Pull image [zyfdedh/unqlite](hub.docker.com/zyfdedh/unqlite) built upon alpine Linux, it's as tiny as 17MB.
Dockerfile is also opensourced on github.[zyfdegh/dockerfile-unqlite](https://github.com/zyfdegh/dockerfile-unqlite)

## Build from source
You can build UnQLite from source. UnQLite is written in C and you need a c compiler.
The source code is also hosted on github. View [symisc/unqlite](https://github.com/symisc/unqlite)

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

# Run unqlite-crud
Clone
```sh
git clone https://github.com/zyfdegh/unqlite-crud.git
```
Build
```sh
./build.sh
```

Similar to SQLite, UnQLite need not to start a daemon process, no port listenning, and no configurations.

Run in container

```sh
docker run -d unqlite
```

After that, copy your binary file like

```sh
docker cp unqlite-crud
```