#!/bin/bash

begin=$1
end=$2

echo "$begin $end"
while (( $begin<=$end ))
do
	conf=`printf "a%04d.yml" $begin`
	kill_pid=`ps -eo pid,lstart,cmd | grep $conf | grep python3.10 | awk -F' '  '{print $1}'`
	kill -9 $kill_pid
	echo "kill pid $conf done. pid = $kill_pid"
	let "begin++"
done
