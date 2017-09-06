DEST_DIR=/usr/local/www/bookmarks/
COMMON_DIR=../wpwmm4/
SRC_DIR=src/

INCLUDE_DIR=include/
VIRT_DIR=virtual/

TARGETS=index.html
index.html_REQ=include/header.m4 scripts/generate_main_list.sh scripts/get_title.sh data/main.psv data/title.psv
TARGETS_MANUAL=bookmarks.css

VIRTUALS=	links

VIRTUALTEMPLATE_links=	links
VIRTUALDIR_links=
VIRTUALOUT_links!=sed 's,$$,/index.html,' data/main.psv

VIRTUALREQ_links=include/header.m4 scripts/get_title.sh scripts/list_links.sh gen/navbar.html data/title.psv
VIRTUALREQRULE_links=C,(.*)/index.html,data/\1.psv,
.for f in bethlen hivatalos szorakozas torvenyek
${f}/index.html_REQ!=ls data/${f}_*.psv
.endfor

gen/navbar.html: data/main.psv scripts/generate_main_list.sh data/title.psv
	@scripts/generate_main_list.sh > ${.TARGET}

${DEST_DIR}bookmarks.css: assets/bookmarks.css
	@cp ${.ALLSRC} ${.TARGET}
