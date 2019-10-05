#!/bin/sh
BLOGDIR=data/blogs/
BLOGFILE=${BLOGDIR}${1}.txt

printf '<h1>%s</h1>\n' "`sed -n 1p "${BLOGFILE}"`"
printf '<h2>%s</h2>\n' "`sed -n 2p "${BLOGFILE}"`"
printf '<div class="blogtext">'
sed '1,5d' "${BLOGFILE}"
printf '</div>'
