#!/bin/sh

IFS="|"
ACCESSKEYS="0123456789abcdefghijklmnopqrstuvwxyz"

FILES=`find data/ -name ${1}_\*.psv | tr '\n' '|'`

printf '<h1>_ACTIVEMENU</h1>\n<div id="maingrouptable">\n<div id="maingroup">\n'
counter=`cat data/main.psv | wc -l | sed "s@^ *@@"`
counter=$((counter+1))
for f in data/${1}.psv ${FILES}; do
  FWP=`echo ${f} | sed 's,data/\(.*\)\.psv,\1,'`
  printf '  <div class="group">\n'
  printf '    <h2>%s</h2>\n' "`grep \"${FWP}|\" data/title.psv | awk -F '|' '{print $2}'`"
  cat ${f} | while read name url; do
    ak=`echo ${ACCESSKEYS} | cut -c ${counter}`
    printf '    <a href="%s" accesskey="%s"><div class="grouphref"><span class="accesskey">%s</span><span class="href">%s</span></div></a>\n' "${url}" "${ak}" "${ak}" "${name}"
    counter=$((counter+1))
  done
  lf=`cat ${f} | wc -l`
  counter=$((counter+lf))
  printf '  </div>\n'
done
printf '</div></div>'
