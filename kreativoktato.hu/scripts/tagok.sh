#!/bin/sh

TAGOKDIR=data/tagok/
TAGOKLISTA=${TAGOKDIR}/tagok.lst

IFS="|"
printf "<div id='tagok'>\n"
while read nev file; do
  printf "  <div class='tag'>\n"
  printf "    <div class='tagimg'><img src='pict/%s' alt='%s'/></div>\n" "${file}.jpg" "${nev} fényképe"
  printf "    <div class='tagleiras'>\n"
  printf "    <span class='tagnev'>%s</span><br>\n" "${nev}"
  sed 's,^,    ,' ${TAGOKDIR}/${file}.txt
  printf "    </div>\n"
  printf "  </div>\n"
done < ${TAGOKLISTA}
printf "</div>\n"
