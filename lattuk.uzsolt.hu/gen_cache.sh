#!/bin/sh

# $Id$

. common.sh

nr=0
grep -v '^#.*' ${LISTAFILE} | \
while IFS=';' read titlehu titleor portnr mafabnr erta ertb titlealthu; do
  title="${titlehu}"
  genre="`sed -n 2p cache/${portnr}`"
  country="`sed -n 3p cache/${portnr}`"
  content="`sed -n 1p cache/${portnr}`"
  nr=$((nr+1))
  [ -n "${titlealthu}" ] && title="${title} / ${titlealthu}"
  LC_ALL=C printf "%s;%s;%s;%s;%.1f;%.1f;%s;%s;%s;%d\n" \
    "${title}" \
    "${titleor}" \
    "`generate_port_link "${portnr}"`" \
    "`generate_mafab_link "${mafabnr}"`" \
    "${erta}" "${ertb}" \
    "${genre}" "${country}" \
    "${content}" "${nr}"
done > ${CACHEFILE}

