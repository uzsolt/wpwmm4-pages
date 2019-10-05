#!/bin/sh

# $1 - generálandó fájl neve (kiterjesztés nélkül)

MENUFILE=data/menus.lst
genfile=${1}.html

printf "<div id='menu'><ul>\n"
printf "<li><img src='/%s' alt='%s'></li>" "pict/logo-menu.png" "EKO"
IFS="|"
while read menu file; do
  printf "  "
  if [ "${genfile}" = "${file}" ]; then
    class="selected_menu"
  else
    class="normal_menu"
  fi
  printf "<li><a href='/%s' class='%s'>%s</a></li>\n" \
    "${file}" "${class}" "${menu}"
done < ${MENUFILE}
printf "</ul></div>\n"
