#!/bin/sh

ACCESSKEYS="0123456789abcdefghijklmnopqrstuvwxyz"

counter=1
for f in `cat data/main.psv`; do
  TITLE=`grep "${f}|" data/title.psv | awk -F '|' '{print $2}'`
  ak=$(echo ${ACCESSKEYS} | cut -c ${counter})
  printf '<a href="%s" accesskey="%s"><span class="accesskey">%s</span>%s</a>\n' "/${f}" "${ak}" "${ak}" "${TITLE}"
  counter=$((counter+1))
done
