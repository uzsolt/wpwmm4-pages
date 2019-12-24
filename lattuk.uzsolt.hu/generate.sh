#!/bin/sh

# $Id$

# $1 - melyik rendező algoritmus kell

PORTBEGIN=https://port.hu/adatlap/film/tv/
MAFABBEGIN=https://www.mafab.hu/movies/
CACHEFILE=cache/film.csv

IMGPORT="<img src='port.png' alt='Port.hu'>"
IMGMAFAB="<img src='mafab.jpg' alt='Mafab.hu'>"

sortalgorithm=$(awk -F ':' '{print $2}' orders.csv | tr '\n' ' ')

print_html_header() {
  cat << EOF
<!DOCTYPE html>
<html lang="hu">
<head>
  <meta charset="utf-8">
  <title>Filmek, amiket már láttunk</title>
<style>
$(cat lattuk.css)
</style>
</head>
<body>
<h1>Filmek, amiket már láttunk</h1>
EOF
}

print_navbar() {
  echo '<div id="ordernav">'
  awk -F ':' -v "curralg=$curralg" '{
    class=$2==curralg?"current":"normal"
    printf "<a href=\"/%s\" class=\"%s\">%s</a>\n", $1, class, $3
  }' orders.csv
  echo '</div>'
}

print_table_header() {
  cat << EOF
<table>
<caption>
r$(svnlite info --show-item revision) $(date +'(%Y-%m-%d %H:%M:%S)')
</caption>
<thead>
  <tr>
   <th>Magyar cím</th>
   <th>Eredeti cím</th>
   <th>Linkek</th>
   <th>ÉrtA</th>
   <th>ÉrtB</th>
   <th>műfaj</th>
   <th>ország</th>
  </tr>
</thead>
<tbody>
EOF
}

print_table_tail() {
  cat << EOF
</tbody>
</table>
EOF
}

print_html_tail() {
  cat << EOF
</body>
</html>
EOF
}

filter_list() {
  grep -v '^#.*' lista.csv
}

print_films_sort_hun() {
  sort -k1 -t ';' ${CACHEFILE} | convert_cache_csv_tr
}

print_films_sort_revdate() {
  # 'tail -r' FreeBSD-specifikus
  tail -r ${CACHEFILE} | convert_cache_csv_tr
}

convert_cache_csv_tr() {
  awk -F ';' -v imgport="${IMGPORT}" -v imgmafab="${IMGMAFAB}" '{
    printf "  <tbody class=\"tbmovie\"><tr>\
    <td class=\"tdhutitle\" rowspan=2>%s</td>\
    <td class=\"tdentitle\">%s</td>\
    <td class=\"tdimg\"><a href=\"%s\">%s</a>\
    <a href=\"%s\">%s</a></td>\
    <td>%s</td>\
    <td>%s</td>\
    <td>%s</td>\
    <td>%s</td></tr>\
    <tr><td colspan=7 class=\"tdcontent\">%s</td>\
  </tr></tbody>\n",
    $1,$2,$3,imgport,$4,imgmafab,$5,$6,$7,$8,$9
  }'
}

detox() {
  tr '[:upper:]' '[:lower:]' | tr 'öüóőúéáí ' 'ouooueai-' | tr -d '()/'
}

# $1 - port azonosító
generate_port_link() {
  printf "%splaceholder/movie-%d" "${PORTBEGIN}" "$1"
}

generate_mafab_link() {
  printf "%s%d" "${MAFABBEGIN}" "$1"
}

generate_html_sort() {
  print_html_header
  print_navbar
  print_table_header
  $curralg
  print_table_tail
  print_html_tail
}

cache() {
  filter_list | \
  while IFS=';' read titlehu titleor portnr mafabnr erta ertb titlealthu; do
    local title="${titlehu}"
    local genre="`sed -n 2p cache/${portnr}`"
    local country="`sed -n 3p cache/${portnr}`"
    local content="`sed -n 1p cache/${portnr}`"
    [ -n "${titlealthu}" ] && title="${title} / ${titlealthu}"
    LC_ALL=C printf "%s;%s;%s;%s;%.1f;%.1f;%s;%s;%s\n" \
      "${title}" \
      "${titleor}" \
      "`generate_port_link "${portnr}"`" \
      "`generate_mafab_link "${mafabnr}"`" \
      "${erta}" "${ertb}" \
      "${genre}" "${country}" \
      "${content}"
  done > ${CACHEFILE}
}

if [ $# -ne 1 ]; then
  cat << EOF
Usage: $0 sort-algorithm
Available algorithms:
  ${sortalgorithm}
EOF
  exit 1
else
  curralg=$1
fi

if [ "${curralg}" = "cache" ]; then
  cache
else
  generate_html_sort
fi
