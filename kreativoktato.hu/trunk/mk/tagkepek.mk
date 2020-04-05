TAGKEPEK!=	sed "s,.*|\(.*\)|.*,\1.jpg," data/tagok/tagok.lst data/onkentesek/onkentesek.lst
TARGETS_MANUAL+=	${TAGKEPEK:@kep@${PICTDIR}/${kep}@}

.for kep in ${TAGKEPEK}
${DEST_DIR}${PICTDIR}/${kep}:	static/tagok/${kep}
	@mkdir -p ${DEST_DIR}${PICTDIR}
	@convert -resize 200 -strip $> $@
.endfor
