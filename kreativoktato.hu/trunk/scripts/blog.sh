#!/bin/sh

# Fájlok felépítése:
# 1. sor: cím
# 2. sor: alcím
# 3. sor: szerző
# 4. sor: cimkék
# 5. sor: rövid összefoglaló
# többi sor: szöveg

. "scripts/function.sh"

if [ "${1}" = "en" ]; then
  BLOGDIR=data/blogs_en/
  STR_CIM="Title"
  STR_SZERZO="Author"
  STR_DATUM="Published"
  STR_CIMKEK="Label"
else
  BLOGDIR=data/blogs/
  STR_CIM="Cím"
  STR_SZERZO="Szerző"
  STR_DATUM="Közzététel"
  STR_CIMKEK="Cimkék"
fi

taglist() {
  sed -n 4p ${BLOGDIR}/*.txt | tr ";" "\n" | sort -u
}

tartalomjegyzek() {

  divtable_begin enableResponsive

  divtable_row_heading \
    "${STR_CIM}" "" \
    "${STR_SZERZO}" "" \
    "${STR_DATUM}" "" \
    "${STR_CIMKEK}" ""

  for blog in $(ls ${BLOGDIR}/*.txt | sort -r); do
    bl=$(echo ${blog} | sed "s,.*/,, ; s,\.txt$,,")
    DATUM=$(date -j -f "%y%m%d" $(echo ${bl} | cut -b 1-6) +"%Y.%m.%d.")
    TITLE=$(sed -n 1p ${blog})
    SUBTITLE=$(sed -n 2p ${blog})
    AUTHOR=$(sed -n 3p ${blog})
    TAGS=$(sed -n "s@;@, @g ; 4p" ${blog})
    HEADLINE=$(sed -n 5p ${blog})
    divtable_row \
      "<a href='/blog/${bl}.html'><div class='bctitlediv'>${TITLE}<br></div></a> ${HEADLINE}" "bctitle" \
      "${AUTHOR}" "bcauthor" \
      "${DATUM}" "bcdate" \
      "${TAGS}" "bctags"
  done

  divtable_end

}

tartalomjegyzek
