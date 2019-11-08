#!/bin/sh

# $1 - generálandó fájl neve (kiterjesztés nélkül)

MENUFILE=data/menus.lst
genfile=${1}.html
lang=${2}

printf "<div id='menu'>\n"
printf "  <div id='menubtn'>MENÜ</div>\n"
printf "  <div id='menucontent'>\n"
printf "    <img src='%s' alt='%s'>\n" "https://static.kreativoktato.hu/pict/logo-menu.png" "EKO"
IFS="|"
while read menu menuen file; do
  if [ "${genfile}" = "${file}" ]; then
    class="selected_menu"
  else
    class="normal_menu"
  fi
  if [ "${lang}" == "hu" ]; then
    _menu=${menu}
  else
    _menu=${menuen}
  fi
  printf "    <a href='/%s' class='%s'>%s</a>\n" \
    "${file}" "${class}" "${_menu}"
done < ${MENUFILE}
printf "  </div>\n</div>\n"
