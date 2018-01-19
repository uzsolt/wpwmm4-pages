# Where the sources (m4) are.
SRC_DIR=src/

# Destination directory
DEST_DIR=/usr/local/www/mano/
COMMON_DIR=/home/zsolt/svn/wpwmm4/
.ifdef WIP
include wip.mk
.endif
# Where the layouts are.
LAYOUT_DIR=layout/

# Virtual directory
VIRT_DIR=virtual/

HOOK_POST_HTML=${MSG2} Checking validity ; tidy5 -q -e -f /dev/stdout ${.TARGET} | sed '/About/,$$d ; s,^,     ,'
HOOK_POST_VHTML=${HOOK_POST_HTML}

# Targets in ${DEST_DIR}
TARGETS=index.html
index.html_REQ+=data/data.psv scripts/generate.sh

TARGETS_MANUAL+=main.css
${DEST_DIR}main.css: css/main.css
	@mkdir -p ${DEST_DIR}css
	sassc -t compressed css/main.css ${.TARGET}

# Global requirement
GREQ=${MENUTARGET} include/01_header.m4

pre-everything:

clean-other:
	rm -rf menu
