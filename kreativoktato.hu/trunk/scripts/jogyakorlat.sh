#!/bin/sh

# Fájlok felépítése:
# 1. sor: cím
# 2. sor: szerző
# 3. sor: cimkék
# többi sor: szöveg

. "scripts/function.sh"

if [ "${1}" = "en" ]; then
  BLOGDIR=data/jogyakorlatok_en/
  STR_CIM="Title"
  STR_SZERZO="Author"
  STR_DATUM="Published"
  STR_CIMKEK="Label"
else
  BLOGDIR=data/jogyakorlatok/
  STR_CIM="Cím"
  STR_SZERZO="Szerző"
  STR_DATUM="Közzététel"
  STR_CIMKEK="Cimkék"
fi

taglist() {
  sed -n 4p ${BLOGDIR}/*.txt | tr ";" "\n" | sort -u
}

tartalomjegyzek() {

  divtable_begin

  divtable_row_heading \
    "${STR_CIM}" "" \
    "${STR_SZERZO}" "" \
    "${STR_DATUM}" "" \
    "${STR_CIMKEK}" ""

  for blog in $(ls ${BLOGDIR}/*.txt | sort -r); do
    bl=$(echo ${blog} | sed "s,.*/,, ; s,\.txt$,,")
    DATUM=$(date -j -f "%y%m%d" $(echo ${bl} | cut -b 1-6) +"%Y.%m.%d.")
    TITLE=$(sed -n 1p ${blog})
    AUTHOR=$(sed -n 2p ${blog})
    TAGS=$(sed -n "s@;@, @g ; 3p" ${blog})
    divtable_row \
      "<a href='/jogyakorlat/${bl}.html'><div class='bctitlediv'>${TITLE}<br></div></a>" "bctitle" \
      "${AUTHOR}" "bcauthor" \
      "${DATUM}" "bcdate" \
      "${TAGS}" "bctags"
  done

  divtable_end

}

tartalomjegyzek
