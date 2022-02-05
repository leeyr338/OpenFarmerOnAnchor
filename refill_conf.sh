#!/bin/bash

begin=$1
end=$2

echo "$begin $end"
while (( $begin<=$end ))
do
        conf=`printf "a%04d.yml" $begin`
        echo "Refill $conf ..."

	# sed need "" for varible.
        sed -i "s/sell_corn: false/sell_corn: true/g" ../config/$conf
        sed -i "s/auto_deposit: false/auto_deposit: true/g" ../config/$conf
        sed -i "s/deposit_fwf: 10/deposit_fwf: 3024/g" ../config/$conf
        sed -i "s/deposit_fwg: 10/deposit_fwg: 0/g" ../config/$conf
        
	let "begin++"
done

