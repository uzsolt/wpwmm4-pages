WWWDIR=		/usr/local/www/lattuk
HTMLRULES!=	awk -F ':' '{print $$1 "/" $$2}' orders.csv
ICONS=		favicon.ico mafab.jpg port.png
CACHEDIR=	cache
CACHEFILE=	${CACHEDIR}/film.csv
CACHEDB!=	awk -F ';' '{print $$3}' lista.csv
CACHEDEPS=	common.sh gen_cache.sh lista.csv

all:	${HTMLRULES:H:@x@${WWWDIR}/${x}@} ${ICONS:@ico@${WWWDIR}/${ico}@}

${CACHEFILE}:	${CACHEDEPS} ${CACHEDB:@portid@${CACHEDIR}/${portid}@}
	@echo Generate $@
	@./gen_cache.sh

.for htmlr in ${HTMLRULES}
${WWWDIR}/${htmlr:H}:	${CACHEFILE} generate.sh lattuk.css
	@echo Generating $@
	@./generate.sh ${htmlr:T} > $@
.endfor

.for cachedb in ${CACHEDB}
${CACHEDIR}/${cachedb}:	gen_db.sh
	@echo "Fetching informations about ${cachedb} (`awk -F ';' '$$3==${cachedb} {print $$1}' lista.csv`)"
	@./gen_db.sh ${cachedb}
.endfor

.for ico in ${ICONS}
${WWWDIR}/${ico}:	${ico}
	cp ${ico} $@
.endfor
