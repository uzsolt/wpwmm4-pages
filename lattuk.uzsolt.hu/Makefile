WWWDIR=		/usr/local/www/lattuk
INDEXHTML=	${WWWDIR}/index.html
ICONS=	mafab_logo_2017.svg port.png

all:	${INDEXHTML} ${ICONS:@ico@${WWWDIR}/${ico}@}

${INDEXHTML}:	generate.sh lattuk.css lista.csv
	./generate.sh > $@

.for ico in ${ICONS}
${WWWDIR}/${ico}:	${ico}
	cp ${ico} $@
.endfor
