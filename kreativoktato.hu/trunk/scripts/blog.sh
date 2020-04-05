#!/bin/sh

# Fájlok felépítése:
# 1. sor: cím
# 2. sor: alcím
# 3. sor: szerző
# 4. sor: cimkék
# 5. sor: rövid összefoglaló
# többi sor: szöveg

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
  cat << EOF
<div class='dtable'>
  <div class='dheading'>
    <div class='dcell'>${STR_CIM}</div>
    <div class='dcell'>${STR_SZERZO}</div>
    <div class='dcell'>${STR_DATUM}</div>
    <div class='dcell'>${STR_CIMKEK}</div>
  </div>
EOF
  for blog in $(ls ${BLOGDIR}/*.txt | sort -r); do
    bl=$(echo ${blog} | sed "s,.*/,, ; s,\.txt$,,")
    DATUM=$(date -j -f "%y%m%d" $(echo ${bl} | cut -b 1-6) +"%Y.%m.%d.")
    TITLE=$(sed -n 1p ${blog})
    SUBTITLE=$(sed -n 2p ${blog})
    AUTHOR=$(sed -n 3p ${blog})
    TAGS=$(sed -n "s@;@, @g ; 4p" ${blog})
    HEADLINE=$(sed -n 5p ${blog})
    printf "  <div class='drow'>
    <div class='dcell bctitle'><a href='%s'><div class='bctitlediv'>%s<br></div></a> (%s)</div>
    <div class='dcell bcauthor'>%s</div>
    <div class='dcell bcdate'>%s</div>
    <div class='dcell bctags'>%s</div>
  </div>\n" \
      "/blog/${bl}.html" "${TITLE}" \
      "${HEADLINE}" \
      "${AUTHOR}" \
      "${DATUM}" \
      "${TAGS}"
  done
  cat << EOF
</div>
EOF
}

tartalomjegyzek
