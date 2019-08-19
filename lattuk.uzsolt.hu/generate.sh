#!/bin/sh

# $Id$

PORTBEGIN=https://port.hu/adatlap/film/tv/
MAFABBEGIN=https://www.mafab.hu/movies/

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
   <th>Port</th>
   <th>Mafab</th>
   <th>ÉrtA</th>
   <th>ÉrtB</th>
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

print_films_sort_hun() {
  grep -v '^#.*' lista.csv | sort -k1 -t ';' | convert_csv_tr
}

convert_csv_tr() {
  while IFS=';' read titlehu titleor portnr mafabnr erta ertb titlealthu; do
    local title="${titlehu}"
    [ -n "${titlealthu}" ] && title="${title} / ${titlealthu}"
    printf "<tr><td>%s</td><td>%s</td>\n\
\t<td class=\"tdimg\"><a href=\"%s\"><img src=\"port.png\" alt=\"Port.hu\"></a></td>\n\
\t<td class=\"tdimg\"><a href=\"%s\"><img src=\"mafab_logo_2017.svg\" alt=\"Mafab\"></a></td>\n\
\t<td>%d</td><td>%d</td></tr>\n" \
      "${title}" \
      "${titleor}" \
      "`generate_port_link "${titlehu}" "${titleor}" "${portnr}"`" \
      "`generate_mafab_link "${mafabnr}"`" \
      "${erta}" "${ertb}"
  done
}

detox() {
  tr '[:upper:]öüóőúéáí ' '[:lower:]ouooueai-' | tr -d '()'
}

# $1 - magyar cím
# $2 - eredeti cím
# $3 - port azonosító
generate_port_link() {
  printf "%s%s--%s/movie-%d" "${PORTBEGIN}" `echo "$1" | detox` `echo "$2" | detox` "$3"
}

generate_mafab_link() {
  printf "%s%d" "${MAFABBEGIN}" "$1"
}

print_html_header
print_table_header
print_films_sort_hun
print_table_tail
print_html_tail
