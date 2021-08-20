TARGETS_MANUAL+=	\
	www_static/pict/projects/fasf_newsletter01_eng.png

${DEST_DIR}${PICTDIR}/projects/fasf_newsletter01_eng.png:	assets/pdf/fasf_newsletter01_eng.pdf
	@convert $>[0] $@

TARGETS+=	\
	fasf.kreativoktato.hu/index.html \
	fasf.kreativoktato.hu/fasf_competition.html \
	fasf.kreativoktato.hu/fasf_consortium.html \
	fasf.kreativoktato.hu/fasf_contact.html \
	fasf.kreativoktato.hu/fasf_description.html \
	fasf.kreativoktato.hu/fasf_digguide.html \
	fasf.kreativoktato.hu/fasf_news.html \
	fasf.kreativoktato.hu/digguide_reading.html \
	fasf.kreativoktato.hu/digguide_watching.html \
	fasf.kreativoktato.hu/digguide_check.html \
	fasf.kreativoktato.hu/digguide_quiz.html \