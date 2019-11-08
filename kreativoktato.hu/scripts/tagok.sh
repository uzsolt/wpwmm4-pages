#!/bin/sh

TAGOKDIR=data/tagok/
TAGOKLISTA=${TAGOKDIR}/tagok.lst

MT_PREFIX="mt_"
ID_NEVJEGYEK="${MT_PREFIX}nevjegyek"

if [ -n "${2}" ]; then
  WWWLANG="_${2}"
  STR_MUNKATARSAINK="Our colleagues"
  STR_NEVJEGYEK="Cards"
  STR_FEL="up"
  STR_BEMUTATKOZAS="Introductions"
else
  WWWLANG=""
  STR_MUNKATARSAINK="Munkatársaink"
  STR_NEVJEGYEK="Névjegyek"
  STR_FEL="fel"
  STR_BEMUTATKOZAS="Bemutatkozások"
fi

is_english() {
  [ -n "${WWWLANG}" ]
}

IFS="|"
print_nevjegyek() {
  printf "<div id='%s'>_H1(${STR_MUNKATARSAINK})
  <h2>${STR_NEVJEGYEK}</h2>\n" "${ID_NEVJEGYEK}"
  while read nev neveng file email; do
    tagfile="${TAGOKDIR}/${file}${WWWLANG}.txt"
    titulus="`head -n1 ${tagfile}`"
    ekorole="`sed -n "2p" ${tagfile}`"
    if is_english; then
      nev="${neveng}"
    fi
    printf "  <a href='%s'><div class='tagnevjegy'>\n\
      <img src='https://static.kreativoktato.hu/pict/%s' alt='kép'>\n\
      <span class='tagnevjegy_nev'>\`%s\'</span><br>\n\
      <span class='tagnevjegy_vegz'>\`%s\'</span><br>\n\
      <span class='tagnevjegy_eko'>\`%s\'</span><br>\n\
      <span class='tagnevjegy_email'>%s</span><br>\n\
    </div></a>\n" \
      "#${MT_PREFIX}${file}" \
      "${file}.jpg" \
      "${nev}" "${titulus}" "${ekorole}" "${email}"
  done < ${TAGOKLISTA}
  printf "</div>\n"
}

print_bemutatkozasok() {
  printf "<div id='tagok'><h2>${STR_BEMUTATKOZAS}</h2>\n"
  hrefvissza="`printf "    <a href='#%s'><div class='hrefvissza'>${STR_FEL}</div></a>\n" "${ID_NEVJEGYEK}"`"
  while read nev neveng file email; do
    tagfile="${TAGOKDIR}/${file}${WWWLANG}.txt"
    if is_english; then
      nev="${neveng}"
    fi
    printf "  <div id='%s%s' class='tag'>\n" "${MT_PREFIX}" "${file}"
    printf "    <div class='tagimg'><img src='https://static.kreativoktato.hu/pict/%s' alt='%s'/></div>\n" "${file}.jpg" "${nev} fényképe"
    printf "    <div class='tagleiras'>\n"
    printf "    <span class='tagnev'>%s (%s)</span><br>\n" "${nev}" "`head -n1 ${tagfile}`"
    printf "    <span class='tagnev_email'><a href=\"mailto:%s\">%s</a></span>" "${email}" "${email}"
    printf "    <p><em>%s</em></p>\n" "`sed -n '2p' ${tagfile}`"
    sed '1,2d ; s,^,    ,' ${tagfile}
    printf "    </div>\n"
    printf "  %s\n" "${hrefvissza}"
    printf "  </div>\n"
  done < ${TAGOKLISTA}
  printf "</div>\n"
}

[ $# -eq 0 ] && (print_nevjegyek; print_bemutatkozasok)
[ "${1}" = "nevjegy" ] && print_nevjegyek
[ "${1}" = "bemutatkozas" ] && print_bemutatkozasok
