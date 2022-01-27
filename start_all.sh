#!/bin/sh

confs=`ls ../config`

for conf in $confs
do
	nohup python3.10 main.py ../config/$conf&
done

