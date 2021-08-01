TARGETS_MANUAL+=	\
	www_static/pict/projects/fasf_newsletter01_eng.png

${DEST_DIR}${PICTDIR}/projects/fasf_newsletter01_eng.png:	assets/pdf/fasf_newsletter01_eng.pdf
	@convert $>[0] $@
