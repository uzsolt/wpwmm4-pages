#!/bin/sh

IFS="|"
FILES=`find data/ -name ${1}_\*.psv | tr '\n' '|'`

printf '<div id="maingroup">\n<h1>_ACTIVEMENU</h1>\n'
for f in data/${1}.psv ${FILES}; do
  FWP=`echo ${f} | sed 's,data/\(.*\)\.psv,\1,'`
  printf '  <div class="group">\n'
  printf '    <h2>%s</h2>\n' "`grep \"${FWP}|\" data/title.psv | awk -F '|' '{print $2}'`"
  cat ${f} | while read name url; do
    printf '    <a href="%s"><div class="grouphref">%s</div></a>\n' "${url}" "${name}"
  done
  printf '  </div>\n'
done
printf '</div>'
