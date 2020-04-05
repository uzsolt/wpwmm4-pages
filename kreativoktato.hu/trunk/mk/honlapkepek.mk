TARGETS_MANUAL+=	${PICTDIR}/favicon.ico ${PICTDIR}/logo.png \
			${PICTDIR}/logo-tr.png \
			${PICTDIR}/logo-tr0.png \
			${PICTDIR}/logo-menu.png

${DEST_DIR}${PICTDIR}/favicon.ico:	static/logo.png
	convert -resize 64 $> $@

${DEST_DIR}${PICTDIR}/logo.png:	static/logo.png
	@cp $> $@

${DEST_DIR}${PICTDIR}/logo-tr.png:	static/logo/logo-small-200px-01.png
	@convert -alpha on -channel a -evaluate set 5% $> $@

${DEST_DIR}${PICTDIR}/logo-tr0.png:	static/logo/logo-small-200px-01.png
	@convert -alpha on -channel a -evaluate set 15% $> tmp.png
	@convert -resize 200 tmp.png $@
	@rm tmp.png

${DEST_DIR}${PICTDIR}/logo-menu.png:	static/logo/logo-small-200px-01.png
	@convert -resize 150 $> $@
