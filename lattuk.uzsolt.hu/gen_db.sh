#!/bin/sh

# $Info$

# $1 - port azonosító

CACHEDIR=cache/

[ $# -ne 1 ] && exit 1

# Generátum soronként:
# 1. leírás (tartalom)
# 2. műfaj
# 3. származási ország
# 4. színész 1
# 5. színész 2
# 6. port-értékelés átlaga
# 7. port-értékelések száma
fetch -q "https://port.hu/adatlap/film/tv/placeholder/movie-${1}" -o - | \
  grep "context" | sed 's,</script>,,' |  \
  jq -r '.description,.genre,.countryOfOrigin[0].name,.actor[0].name,.actor[1].name,.aggregateRating.ratingValue,.aggregateRating.ratingCount' \
  > ${CACHEDIR}/$1
