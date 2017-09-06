DEST_DIR=/home/zsolt/public_html/bookmarks/
SRC_DIR=src/

INCLUDE_DIR=include/
VIRT_DIR=virtual/

TARGETS=index.html
TARGETS_MANUAL=bookmarks.css

VIRTUALS=	links

VIRTUALTEMPLATE_links=	links
VIRTUALDIR_links=
VIRTUALOUT_links!=sed 's,$$,/index.html,' data/main.psv

VIRTUALREQ_links=include/header.m4 scripts/get_title.sh scripts/list_links.sh gen/navbar.html
VIRTUALREQRULE_links=C,(.*)/index.html,data/\1.psv,

gen/navbar.html: data/main.psv scripts/generate_main_list.sh
	@scripts/generate_main_list.sh > ${.TARGET}

${DEST_DIR}bookmarks.css: assets/bookmarks.css
	@cp ${.ALLSRC} ${.TARGET}
