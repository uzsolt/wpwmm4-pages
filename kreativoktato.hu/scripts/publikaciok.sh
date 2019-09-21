#!/bin/sh

IFS="|"
while read title file; do
  printf "<h2>%s</h2>\n" "${title}"
  printf "<ul>\n"
  while read author year title where; do
    printf "  <li><b>%s</b> (%s): <i>%s</i><br>%s</li>\n" "${author}" "${year}" "${title}" "${where}"
  done < data/publikaciok/${file}.csv
  printf "</ul>\n"
done < data/publikaciok/lista.csv
