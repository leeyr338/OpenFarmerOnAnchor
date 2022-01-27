#!/bin/sh

conf=`printf "a%04d.yml" $1`
nohup python3.10 main.py ../config/$conf&
echo "start $conf done"
