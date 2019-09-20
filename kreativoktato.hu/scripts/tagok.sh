#!/bin/sh

TAGOKDIR=data/tagok/
TAGOKLISTA=${TAGOKDIR}/tagok.lst

MT_PREFIX="mt_"

IFS="|"
printf "<table id='%s'>\n" "${MT_PREFIX}table"
printf "<thead><tr><td>Név</td><td>Végzettség</td><td>Szerep</td></tr></thead>\n"
printf "<tbody>\n"
while read nev file; do
  tagfile="${TAGOKDIR}/${file}.txt"
  titulus="`head -n1 ${tagfile}`"
  ekorole="`sed -n "2p" ${tagfile}`"
  printf "  <tr><td><a href='%s'>%s</a></td><td>%s</td><td>%s</td></tr>\n" \
    "#${MT_PREFIX}${file}" "${nev}" "${titulus}" "${ekorole}"
done < ${TAGOKLISTA}
printf "</tbody></table><hr>\n"

printf "<div id='tagok'>\n"
hrefvissza="`printf "    <a href='#%s'><div class='hrefvissza'>fel</div></a>\n" "${MT_PREFIX}table"`"
while read nev file; do
  tagfile="${TAGOKDIR}/${file}.txt"
  printf "  <div id='%s%s' class='tag'>\n" "${MT_PREFIX}" "${file}"
  printf "    <div class='tagimg'><img src='pict/%s' alt='%s'/></div>\n" "${file}.jpg" "${nev} fényképe"
  printf "    <div class='tagleiras'>\n"
  printf "    <span class='tagnev'>%s (%s)</span><br>\n" "${nev}" "`head -n1 ${tagfile}`"
  printf "    <p>%s</p>\n" "`sed -n '2p' ${tagfile}`"
  sed '1,2d ; s,^,    ,' ${tagfile}
  printf "    </div>\n"
  printf "  %s\n" "${hrefvissza}"
  printf "  </div>\n"
done < ${TAGOKLISTA}
printf "</div>\n"
