COMMON_DIR=	/home/zsolt/svn/wpwmm4/
INCLUDE_DIR=	include/
SRC_DIR=	src/
DEST_DIR=	generated/
LAYOUT_DIR=	layouts/

ASSETS_DIR=	assets/
ASSETS_CP=	rsync

PICTDIR=	pict

TARGETS+=	index.html \
		blog.html \
		globalis.html \
		kapcsolat.html \
		munkatarsak.html \
		partnerek.html \
		projektek.html \
		publikaciok.html
blog.html_REQ+=	scripts/blog.sh
munkatarsak.html_REQ!=	sed "s,.*|\(.*\),data/tagok/\1.txt," data/tagok/tagok.lst
munkatarsak.html_REQ+=	scripts/tagok.sh
publikaciok.html_REQ!=	sed "s,.*|\(.*\),data/publikaciok/\1.csv," data/publikaciok/lista.csv
publikaciok.html_REQ+=	layouts/munkatarsak.m4 scripts/publikaciok.sh data/publikaciok/lista.csv
.for t in ${TARGETS}
req!=	sed -n '/_LAYOUT/ s,_LAYOUT(.\(.*\).).*,\1,p' src/${t:R}.m4
${t}_REQ+=	${LAYOUT_DIR}${req}
.endfor
GREQ=	scripts/menu.sh include/base.m4

TAGKEPEK!=	sed "s,.*|\(.*\),\1.jpg," data/tagok/tagok.lst
TARGETS_MANUAL+=	${TAGKEPEK:@kep@${PICTDIR}/${kep}@}
TARGETS_MANUAL+=	css/eko.css
TARGETS_MANUAL+=	${PICTDIR}/favicon.ico ${PICTDIR}/logo.png \
			${PICTDIR}/logo-tr.png \
			${PICTDIR}/logo-menu.png

VIRT_DIR=	virtuals/
VIRTUALS+=	blog
VIRTUALTEMPLATE_blog=	blog
VIRTUALDIR_blog=	blog/
VIRTUALOUT_blog!=	ls data/blogs/ | sed 's,\.txt$$,.html,'
VIRTUALREQ_blog=	scripts/blogentry.sh layouts/main.m4
VIRTUALREQRULE_blog=	C,.html,.txt,:C,^,data/blogs/,

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

${DEST_DIR}${PICTDIR}/logo-tr.png:	static/logo/logo-small-200px-01.png
	@convert -alpha on -channel a -evaluate set 5% $> $@

${DEST_DIR}${PICTDIR}/logo-menu.png:	static/logo/logo-small-200px-01.png
	@convert -resize 150 $> $@

upload:
	cat upload.lftp | lftp
