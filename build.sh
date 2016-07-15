#!/bin/bash

go get -u -v github.com/svkior/unqlitego

go build -a -o bin/unqlite-crud ./main.go
