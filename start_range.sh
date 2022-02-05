#!/bin/bash

begin=$1
end=$2

echo "$begin $end"
while (( $begin<=$end ))
do
	conf=`printf "a%04d.yml" $begin`
	nohup python3.10 main.py ../config/$conf&
	echo "start $conf done"
	let "begin++"
done
