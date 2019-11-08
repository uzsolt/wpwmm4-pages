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
else
  BLOGDIR=data/blogs/
fi

taglist() {
  sed -n 4p ${BLOGDIR}/*.txt | tr ";" "\n" | sort -u
}

tartalomjegyzek() {
  cat << EOF
<table id="blogtoc">
<thead>
  <tr>
    <th>Cím</th>
    <th>Szerző</th>
    <th>Közzététel</th>
    <th>Cimkék</th>
  </tr>
</thead>
<tbody>
EOF
  for blog in $(ls ${BLOGDIR}/*.txt | sort -r); do
    bl=$(echo ${blog} | sed "s,.*/,, ; s,\.txt$,,")
    DATUM=$(date -j -f "%y%m%d" $(echo ${bl} | cut -b 1-6) +"%Y.%m.%d.")
    TITLE=$(sed -n 1p ${blog})
    SUBTITLE=$(sed -n 2p ${blog})
    AUTHOR=$(sed -n 3p ${blog})
    TAGS=$(sed -n "s@;@, @g ; 4p" ${blog})
    HEADLINE=$(sed -n 5p ${blog})
    printf "  <tr>
    <td class='bctitle'><a href='%s'><div class='bctitlediv'>%s<br><span class='bcheadline'>%s</span></div></a></td>
    <td class='bcauthor'>%s</td>
    <td class='bcdate'>%s</td>
    <td class='bctags'>%s</td>
  </tr>\n" \
      "/blog/${bl}.html" "${TITLE}" \
      "${HEADLINE}" \
      "${AUTHOR}" \
      "${DATUM}" \
      "${TAGS}"
  done
  cat << EOF
</tbody>
</table>
EOF
}

tartalomjegyzek
