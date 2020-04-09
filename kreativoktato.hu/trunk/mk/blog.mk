.for l in ${LANG_DIRS}
${l}/blog.html_REQ+=	scripts/blog.sh scripts/function.sh
.endfor
blogbejegyzesek!=	echo data/blogs/*
${LANG_HU_DIR}/blog.html_REQ+=	${blogbejegyzesek}
blogbejegyzesek_en!=	echo data/blogs_en/*
${LANG_EN_DIR}/blog.html_REQ+=	${blogbejegyzesek_en}

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
