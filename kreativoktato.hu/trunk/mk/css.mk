TARGETS_MANUAL+=	www_static/css/eko.css
EKO.CSS_DEPS!=	sed -n '/^@import/ s,.*"\([^"]*\)";,static/\1,p' static/eko.scss
${ASSETS_DEST_DIR}css/eko.css:	static/eko.scss ${EKO.CSS_DEPS}
	@mkdir -p ${ASSETS_DEST_DIR}css
	sassc -t compressed ${>:[1]} $@

TARGETS_MANUAL+=	www_static/css/fasf.css
FASF.CSS_DEPS!=	sed -n '/^@import/ s,.*"\([^"]*\)";,static/\1,p' static/fasf.scss
${ASSETS_DEST_DIR}css/fasf.css:	static/fasf.scss ${FASF.CSS_DEPS}
	@mkdir -p ${ASSETS_DEST_DIR}css
	sassc -t compressed ${>:[1]} $@
