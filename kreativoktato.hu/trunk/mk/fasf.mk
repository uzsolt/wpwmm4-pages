TARGETS_MANUAL+=	\
	www_static/pict/projects/fasf_newsletter01_eng.png \
	www_static/pict/projects/fasf_newsletter01_gre.png

${DEST_DIR}${PICTDIR}/projects/fasf_newsletter01_gre.png:	assets/pdf/fasf_newsletter01_gre.pdf
	@convert $>[0] $@

${DEST_DIR}${PICTDIR}/projects/fasf_newsletter01_eng.png:	assets/pdf/fasf_newsletter01_eng.pdf
	@convert $>[0] $@
