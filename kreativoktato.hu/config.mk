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
publikaciok.html_REQ!=	sed "s,.*|\(.*\),data/publikaciok/\1.csv," data/publikaciok/lista.csv
publikaciok.html_REQ+=	scripts/publikaciok.sh data/publikaciok/lista.csv
.for t in ${TARGETS}
${t}_REQ+=	layouts/main.m4
.endfor
GREQ=	scripts/menu.sh

TAGKEPEK!=	sed "s,.*|\(.*\),\1.jpg," data/tagok/tagok.lst
TARGETS_MANUAL+=	${TAGKEPEK:@kep@${PICTDIR}/${kep}@}
TARGETS_MANUAL+=	css/eko.css
TARGETS_MANUAL+=	${PICTDIR}/favicon.ico ${PICTDIR}/logo.png \
			${PICTDIR}/logo-tr.png

${DEST_DIR}css/eko.css:	static/eko.scss
	@mkdir -p ${DEST_DIR}css
	sassc -t compressed $> $@

.for kep in ${TAGKEPEK}
${DEST_DIR}${PICTDIR}/${kep}:	static/tagok/${kep}
	@mkdir -p ${DEST_DIR}${PICTDIR}
	@convert -resize 200 -strip $> $@
.endfor

${DEST_DIR}${PICTDIR}/favicon.ico:	static/logo.png
	convert -resize 64 $> $@

${DEST_DIR}${PICTDIR}/logo.png:	static/logo.png
	@cp $> $@

${DEST_DIR}${PICTDIR}/logo-tr.png:	static/logo.png
	@convert -alpha on -channel a -evaluate set 5% $> $@

upload:
	cat upload.lftp | lftp
