#!/bin/sh

printf "m4_define(\`_ACTIVEMENU\',\`%s\')\n" "`grep "${1}|" data/title.psv | awk -F '|' '{print $2}'`"
