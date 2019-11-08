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
	globalis.html \
	jogyakorlat.html \
	kapcsolat.html \
	munkatarsak.html \
	partnerek.html \
	projektek.html \
	publikaciok.html
.for l in ${LANG_DIRS}
TARGETS+=	${PAGES:@t@${l}/$t@}
.endfor

publikaciocsoportok!=	sed "s,.*|\(.*\),data/publikaciok/\1.csv," data/publikaciok/lista.csv
${LANG_HU_DIR}/munkatarsak.html_REQ!=	sed "s,.*|\(.*\)|.*,data/tagok/\1.txt," data/tagok/tagok.lst
${LANG_EN_DIR}/munkatarsak.html_REQ!=	sed "s,.*|\(.*\)|.*,data/tagok/\1_en.txt," data/tagok/tagok.lst
.for l in ${LANG_DIRS}
${l}/blog.html_REQ+=	scripts/blog.sh
${l}/munkatarsak.html_REQ+=	scripts/tagok.sh \
				data/tagok/tagok.lst
${l}/publikaciok.html_REQ+=	${publikaciocsoportok} \
				scripts/publikaciok.sh \
				data/publikaciok/lista.csv
.endfor
blogbejegyzesek!=	echo data/blogs/*
${LANG_HU_DIR}/blog.html_REQ+=	${blogbejegyzesek}
blogbejegyzesek_en!=	echo data/blogs_en/*
${LANG_EN_DIR}/blog.html_REQ+=	${blogbejegyzesek_en}

.for t in ${TARGETS}
req!=	sed -n '/_LAYOUT/ s,_LAYOUT(.\(.*\).).*,\1,p' src/${t:R}.m4
${t}_REQ+=	${LAYOUT_DIR}${req}
.endfor
GREQ=	scripts/menu.sh \
	include/base.m4 include/base_en.m4 include/base_hu.m4 \
	data/menus.lst

TAGKEPEK!=	sed "s,.*|\(.*\)|.*,\1.jpg," data/tagok/tagok.lst
TARGETS_MANUAL+=	${TAGKEPEK:@kep@${PICTDIR}/${kep}@}
TARGETS_MANUAL+=	www_static/css/eko.css
TARGETS_MANUAL+=	${PICTDIR}/favicon.ico ${PICTDIR}/logo.png \
			${PICTDIR}/logo-tr.png \
			${PICTDIR}/logo-tr0.png \
			${PICTDIR}/logo-menu.png

VIRT_DIR=	virtuals/
VIRTUALS+=	blog blog_en

VIRTUALTEMPLATE_blog=	blog
VIRTUALDIR_blog=	${LANG_HU_DIR}/blog/
VIRTUALOUT_blog!=	ls data/blogs/ | sed 's,\.txt$$,.html,'
VIRTUALREQ_blog=	scripts/blogentry.sh layouts/main.m4
VIRTUALREQRULE_blog=	C,.html,.txt,:C,^,data/blogs/,

VIRTUALTEMPLATE_blog_en=	blog_en
VIRTUALDIR_blog_en=	${LANG_EN_DIR}/blog/
VIRTUALOUT_blog_en!=	ls data/blogs_en/ | sed 's,\.txt$$,.html,'
VIRTUALREQ_blog_en=	scripts/blogentry.sh layouts/main_en.m4
VIRTUALREQRULE_blog_en=	C,.html,.txt,:C,^,data/blogs_en/,

${ASSETS_DEST_DIR}css/eko.css:	static/eko.scss static/responsive.scss
	@mkdir -p ${ASSETS_DEST_DIR}css
	sassc -t compressed ${>:[1]} $@

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

${DEST_DIR}${PICTDIR}/logo-tr0.png:	static/logo/logo-small-200px-01.png
	@convert -alpha on -channel a -evaluate set 15% $> tmp.png
	@convert -resize 200 tmp.png $@
	@rm tmp.png

${DEST_DIR}${PICTDIR}/logo-menu.png:	static/logo/logo-small-200px-01.png
	@convert -resize 150 $> $@

upload:
	cat upload.lftp | lftp
