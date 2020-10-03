#!/bin/sh

get_field() {
  echo "${1}" | awk -F '|' -v param=$2 '{print $param}'
}

format_url() {
  echo "${*}" | sed 's,\&,%26,g'
}

# title
# icon
# url
print_div() {
  printf '\t<a href="%s"><div class="%s">\n' "$(format_url $3)" "container"
  printf '\t\t<div class="descr">%s</div>\n' "$1"
  printf '\t\t<div class="%s">\n' "pictdiv"
  printf '\t\t<span class="helper"></span><img src="icons/%s" alt="%s" class="%s"/>\n' "$2" "$1" "pict"
  printf '\t\t</div>\n'
  printf '\t</div></a>\n'
}

while read line; do
  TITLE=`get_field "${line}" 1`
  ICON=`get_field "${line}" 2`
  URL=`get_field "${line}" 3`

  print_div "${TITLE}" "${ICON}" "${URL}"
done < data/data.psv
