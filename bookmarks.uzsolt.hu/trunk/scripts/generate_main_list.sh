#!/bin/sh

for f in `cat data/main.psv`; do
  TITLE=`grep "${f}|" data/title.psv | awk -F '|' '{print $2}'`
  printf '<a href="%s">%s</a>\n' "/${f}" "${TITLE}"
done
