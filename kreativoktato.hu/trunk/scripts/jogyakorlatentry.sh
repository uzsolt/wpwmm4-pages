#!/bin/sh
if [ "${2}" == "en" ]; then
  BLOGDIR=data/jogyakorlatok_en/
else
  BLOGDIR=data/jogyakorlatok/
fi
BLOGFILE=${BLOGDIR}${1}.txt

BLOG_TITLE=`sed -n 1p "${BLOGFILE}"`
printf '_2_HEAD(_TITLE(%s))' "${BLOG_TITLE}"
printf '_H1(%s)\n' "${BLOG_TITLE}"
printf '<b>(%s, %s)</b>\n' \
  "$(sed -n '2p' ${BLOGFILE})" \
  "$(date -j -f "%y%m%d" $(echo ${1} | cut -b 1-6) +"%Y. %B %d.")"
printf '<div class="blogtext">'
sed '1,3d' "${BLOGFILE}"
printf '</div>'
