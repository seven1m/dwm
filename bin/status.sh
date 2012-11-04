#!/bin/bash

wired=`wicd-cli -z -d`
if [[ "$wired" != "" ]]; then
  ip=`echo "$wired" | grep IP`
else
  wifi=`wicd-cli -y -d`
  ip="`echo "$wifi" | grep IP` (`echo "$wifi" | grep Essid`)"
fi

xsetroot -name "`date` | `uptime | cut -d ' ' -f 12-` | $ip |`acpi -b | cut -d ',' -f 2-`"
