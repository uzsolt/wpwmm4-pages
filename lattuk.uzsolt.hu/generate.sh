#!/bin/sh

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
<thead>
  <tr>
   <th>Magyar cím</th>
   <th>Eredeti cím</th>
   <th>Port.hu link</th>
   <th>Mafab.hu link</th>
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
  sort -k1 -t ';' lista.csv | convert_csv_tr
}

convert_csv_tr() {
  while IFS=';' read titlehu titleor portnr mafabnr erta ertb; do
    printf "<tr><td>%s</td><td>%s</td><td><a href=\"%s\">Port.hu</a></td><td><a href=\"%s\">Mafab.hu</a></td><td>%d</td><td>%d</td></tr>\n" \
      "${titlehu}" \
      "${titleor}" \
      "`generate_port_link "${titlehu}" "${titleor}" "${portnr}"`" \
      "`generate_mafab_link "${titlehu}" "${mafabnr}"`" \
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
  printf "%s%s-%d.html" "${MAFABBEGIN}" `echo "$1" | detox` "$2"
}

print_html_header
print_table_header
print_films_sort_hun
print_table_tail
print_html_tail
