TARGETS_MANUAL+=	www_static/css/eko.css
${ASSETS_DEST_DIR}css/eko.css:	static/eko.scss static/pdf.scss static/responsive.scss static/table.scss
	@mkdir -p ${ASSETS_DEST_DIR}css
	sassc -t compressed ${>:[1]} $@

