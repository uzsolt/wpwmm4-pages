COOKIE_JS=	js/cookie_hu.js js/cookie_en.js
TARGETS_MANUAL+=	${COOKIE_JS:@v@www_static/${v}@}
COOKIE_JS_SCRIPT=	scripts/create-cookie_js.sh

${COOKIE_JS:@v@${ASSETS_DEST_DIR}${v}@}:	${COOKIE_JS_SCRIPT}
	@${COOKIE_JS_SCRIPT} ${ASSETS_DEST_DIR}
