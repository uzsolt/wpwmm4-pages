PAGES+=	munkatarsak.html \
	onkentesek.html

${LANG_HU_DIR}/munkatarsak.html_REQ!=	sed "s,.*|\(.*\)|.*,data/tagok/\1.txt," data/tagok/tagok.lst
${LANG_EN_DIR}/munkatarsak.html_REQ!=	sed "s,.*|\(.*\)|.*,data/tagok/\1_en.txt," data/tagok/tagok.lst

.for l in ${LANG_DIRS}
${l}/munkatarsak.html_REQ+=	scripts/tagok.sh \
				data/tagok/tagok.lst
${l}/onkentesek.html_REQ+=	scripts/tagok.sh scripts/onkentesek.sh \
				data/onkentesek/onkentesek.lst
.endfor

