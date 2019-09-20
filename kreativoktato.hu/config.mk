COMMON_DIR=	/home/zsolt/svn/wpwmm4/
INCLUDE_DIR=	include/
SRC_DIR=	src/
DEST_DIR=	generated/
LAYOUT_DIR=	layouts/

PICTDIR=	pict

TARGETS+=	index.html \
		bemutatkozas.html \
		blog.html \
		globalis.html \
		kapcsolat.html \
		munkatarsak.html \
		partnerek.html \
		projektek.html \
		publikaciok.html
munkatarsak.html_REQ!=	sed "s,.*|\(.*\),data/tagok/\1.txt," data/tagok/tagok.lst
munkatarsak.html_REQ+=	scripts/tagok.sh
GREQ=	scripts/menu.sh

TAGKEPEK!=	sed "s,.*|\(.*\),\1.jpg," data/tagok/tagok.lst
TARGETS_MANUAL+=	${TAGKEPEK:@kep@${PICTDIR}/${kep}@}
TARGETS_MANUAL+=	css/eko.css

${DEST_DIR}css/eko.css:	static/eko.scss
	@mkdir -p ${DEST_DIR}css
	sassc -t compressed $> $@

.for kep in ${TAGKEPEK}
${DEST_DIR}${PICTDIR}/${kep}:	static/tagok/${kep}
	@mkdir -p ${DEST_DIR}${PICTDIR}
	@convert -resize 200 -strip $> $@
.endfor

upload:
	cat upload.lftp | lftp
