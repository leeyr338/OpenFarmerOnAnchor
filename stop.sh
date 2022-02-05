#!/bin/sh

conf=`printf "%sa%04d.yml" $2 $1`

kill_pid=`ps -eo pid,lstart,cmd | grep $conf | grep python3.10 | awk -F' '  '{print $1}'`
kill -9 $kill_pid
echo "kill pid $conf done. pid = $kill_pid"

