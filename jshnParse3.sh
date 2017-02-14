#!/bin/sh

. /usr/share/libubox/jshn.sh

json_init
MSG=$(cat /data2.txt)

## MSG is:
## {
## "status": 200,
## "msg": "ok",
## "result": {
## "number": "99",
## "mac": "d85d4c9c2f1a",
## "last_seen": 1363777473407
## }
## }

json_load "$MSG"
json_get_var status status
json_get_var msg msg
json_select result
json_get_var number number
json_get_var mac mac
json_get_var last_seen last_seen
