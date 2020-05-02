.for l in ${LANG_DIRS}
${l}/jogyakorlat.html_REQ+=	scripts/jogyakorlat.sh
.endfor
jogyakorlatok!=	echo data/jogyakorlatok/*
${LANG_HU_DIR}/jogyakorlat.html_REQ+=	${jogyakorlatok}
jogyakorlatok_en!=	echo data/jogyakorlatok_en/*
${LANG_EN_DIR}/jogyakorlat.html_REQ+=	${jogyakorlatok_en}

VIRTUALS+=	jogyakorlat jogyakorlat_en

VIRTUALTEMPLATE_jogyakorlat=	jogyakorlat
VIRTUALDIR_jogyakorlat=	${LANG_HU_DIR}/jogyakorlat/
VIRTUALOUT_jogyakorlat!=	ls data/jogyakorlatok/ | sed 's,\.txt$$,.html,'
VIRTUALREQ_jogyakorlat=	scripts/jogyakorlatentry.sh layouts/main.m4
VIRTUALREQRULE_jogyakorlat=	C,.html,.txt,:C,^,data/jogyakorlatok/,

VIRTUALTEMPLATE_jogyakorlat_en=	jogyakorlat_en
VIRTUALDIR_jogyakorlat_en=	${LANG_EN_DIR}/jogyakorlat/
VIRTUALOUT_jogyakorlat_en!=	ls data/jogyakorlatok_en/ | sed 's,\.txt$$,.html,'
VIRTUALREQ_jogyakorlat_en=	scripts/jogyakorlatentry.sh layouts/main_en.m4
VIRTUALREQRULE_jogyakorlat_en=	C,.html,.txt,:C,^,data/jogyakorlatok_en/,
.for l in ${LANG_DIRS}
${l}/jogyakorlat/200311_online_teszt.html_REQ+=	scripts/jogyakorlat-online_teszt.sh
.endfor
