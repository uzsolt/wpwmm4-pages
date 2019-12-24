WWWDIR=		/usr/local/www/lattuk
HTMLRULES!=	awk -F ':' '{print $$1 "/" $$2}' orders.csv
ICONS=		favicon.ico mafab.jpg port.png
CACHEDIR=	cache
CACHEFILE=	${CACHEDIR}/film.csv

all:	${HTMLRULES:H:@x@${WWWDIR}/${x}@} ${ICONS:@ico@${WWWDIR}/${ico}@}

${CACHEFILE}:	generate.sh lista.csv
	@echo Generate $@
	@./generate.sh cache

.for htmlr in ${HTMLRULES}
${WWWDIR}/${htmlr:H}:	${CACHEFILE} lattuk.css
	@echo Generating $@
	@./generate.sh ${htmlr:T} > $@
.endfor

.for ico in ${ICONS}
${WWWDIR}/${ico}:	${ico}
	cp ${ico} $@
.endfor
