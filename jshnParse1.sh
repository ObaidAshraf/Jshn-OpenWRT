#!/bin/sh

. /usr/share/libubox/jshn.sh

json_init
MSG=$(cat /data1.txt)

## MSG has data:
## {"ip_addrs":{"lan":["192.168.0.100","192.168.0.101","192.168.0.200"],"wan":["10.11.12.22","10.11.12.23", "10.11.12.25"]}}


json_load "$MSG"
json_select "ip_addrs"

if json_get_type Type lan && [ "$Type" == array ]
then
	json_select lan
	local idx="1"
	while json_get_type Type "$idx" && [ "$Type" == string ]	## iterate over data inside "lan" object
	do
		json_get_var ip_addr $idx 
		echo "$mac"
		$((idx++)) 2> /dev/null
	done
fi

json_load "$MSG"
json_select "ip_addrs"
if json_get_type Type wan && [ "$Type" == array ]
then
	json_select wan
	local idx="1"
	while json_get_type Type "$idx" && [ "$Type" == string ]	## iterate over data inside "wan" object
	do
		json_get_var ip_addr $idx 
		echo "$mac"
		$((idx++)) 2> /dev/null
	done
fi
