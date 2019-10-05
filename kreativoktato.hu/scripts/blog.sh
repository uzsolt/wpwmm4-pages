#!/bin/sh

# Fájlok felépítése:
# 1. sor: cím
# 2. sor: alcím
# 3. sor: szerző
# 4. sor: cimkék
# 5. sor: rövid összefoglaló
# többi sor: szöveg

BLOGDIR=data/blogs/
taglist() {
  sed -n 4p data/blogs/*.txt | tr ";" "\n" | sort -u
}

tartalomjegyzek() {
  echo '<div id="blogcontent">'
  for blog in ${BLOGDIR}/*.txt; do
    bl=$(echo ${blog} | sed "s,.*/,, ; s,\.txt$,,")
    DATUM=$(date -j -f "%y%m%d" $(echo ${bl} | cut -b 1-6) +"%Y.%m.%d.")
    TITLE=$(sed -n 1p ${blog})
    SUBTITLE=$(sed -n 2p ${blog})
    AUTHOR=$(sed -n 3p ${blog})
    TAGS=$(sed -n "s@;@, @g ; 4p" ${blog})
    HEADLINE=$(sed -n 5p ${blog})
    printf "  <a href='%s'><div class='blogentry'>
    <div class='blogtitle'>%s</div>
    <div class='blogsubtitle'>%s</div>
    <div class='blogheadline'>%s</div>
    <div class='blogdate'>%s</div>
    <div class='blogauthor'>%s</div>
    <div class='blogtags'>%s</div>
  </div></a>\n" \
       "/blog/${bl}.html" "${TITLE}" "${SUBTITLE}" "${HEADLINE}" "${DATUM}" "${AUTHOR}" "${TAGS}"
  done
  echo '</div>'
}

tartalomjegyzek
