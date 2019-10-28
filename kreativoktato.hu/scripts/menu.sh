#!/bin/sh

# $1 - generálandó fájl neve (kiterjesztés nélkül)

MENUFILE=data/menus.lst
genfile=${1}.html

printf "<div id='menu'>\n"
printf "  <div id='menubtn'>MENÜ</div>\n"
printf "  <div id='menucontent'>\n"
printf "    <img src='/%s' alt='%s'>\n" "pict/logo-menu.png" "EKO"
IFS="|"
while read menu file; do
  if [ "${genfile}" = "${file}" ]; then
    class="selected_menu"
  else
    class="normal_menu"
  fi
  printf "    <a href='/%s' class='%s'>%s</a>\n" \
    "${file}" "${class}" "${menu}"
done < ${MENUFILE}
printf "  </div>\n</div>\n"
