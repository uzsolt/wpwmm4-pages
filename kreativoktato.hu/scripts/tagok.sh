#!/bin/sh

TAGOKDIR=data/tagok/
TAGOKLISTA=${TAGOKDIR}/tagok.lst

MT_PREFIX="mt_"
ID_NEVJEGYEK="${MT_PREFIX}nevjegyek"

IFS="|"
printf "<div id='%s'><h2>Névjegyek</h2>\n" "${ID_NEVJEGYEK}"
while read nev file; do
  tagfile="${TAGOKDIR}/${file}.txt"
  titulus="`head -n1 ${tagfile}`"
  ekorole="`sed -n "2p" ${tagfile}`"
  printf "  <a href='%s'><div class='tagnevjegy'>\n\
    <img src='pict/%s' alt='kép'>\n\
    <span class='tagnevjegy_nev'>%s</span><br>\n\
    <span class='tagnevjegy_vegz'>%s</span><br>\n\
    <span class='tagnevjegy_eko'>%s</span><br>\n\
  </div></a>\n" \
    "#${MT_PREFIX}${file}" \
    "${file}.jpg" \
    "${nev}" "${titulus}" "${ekorole}"
done < ${TAGOKLISTA}
printf "</div>\n"

printf "<div id='tagok'><h2>Bemutatkozások</h2>\n"
hrefvissza="`printf "    <a href='#%s'><div class='hrefvissza'>fel</div></a>\n" "${ID_NEVJEGYEK}"`"
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
