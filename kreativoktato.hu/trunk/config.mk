COMMON_DIR=	/home/zsolt/svn/wpwmm4/
INCLUDE_DIR=	include/
SRC_DIR=	src/
DEST_DIR=	generated/
LAYOUT_DIR=	layouts/

ASSETS_DIR=	assets/
ASSETS_DEST_DIR=	${DEST_DIR}www_static/
ASSETS_CP=	rsync -a

PICTDIR=	www_static/pict

LANG_HU_DIR=	public_html
LANG_EN_DIR=	www_english
LANG_DIRS=	${LANG_HU_DIR} \
		${LANG_EN_DIR}

PAGES+=	index.html \
	blog.html \
	gdpr.html \
	globalis.html \
	jogyakorlat.html \
	kapcsolat.html \
	partnerek.html \
	projektek.html \
	publikaciok.html

.for l in ${LANG_DIRS}
TARGETS+=	${PAGES:@t@${l}/$t@}
.endfor

.for t in ${TARGETS}
req!=	sed -n '/_LAYOUT/ s,_LAYOUT(.\(.*\).).*,\1,p' src/${t:R}.m4
${t}_REQ+=	${LAYOUT_DIR}${req}
.endfor

GREQ=	scripts/menu.sh \
	include/base.m4 include/base_en.m4 include/base_hu.m4 \
	data/menus.lst

VIRT_DIR=	virtuals/

upload:
	cat upload.lftp | lftp

.include "includes.mk"
