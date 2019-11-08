#!/bin/sh
if [ "${2}" == "en" ]; then
  BLOGDIR=data/blogs_en/
else
  BLOGDIR=data/blogs/
fi
BLOGFILE=${BLOGDIR}${1}.txt

printf '_H1(%s)\n' "`sed -n 1p "${BLOGFILE}"`"
printf '<h2>%s</h2>\n' "`sed -n 2p "${BLOGFILE}"`"
printf '<b>(%s, %s)</b>\n' \
  "$(sed -n '3p' ${BLOGFILE})" \
  "$(date -j -f "%y%m%d" $(echo ${1} | cut -b 1-6) +"%Y. %B %d.")"
printf '<div class="blogtext">'
sed '1,5d' "${BLOGFILE}"
printf '</div>'
