WWWDIR=		/usr/local/www/lattuk
HTMLRULES!=	awk -F ':' '{print $$1 "/" $$2}' orders.csv
ICONS=		favicon.ico mafab.jpg port.png

all:	${HTMLRULES:H:@x@${WWWDIR}/${x}@} ${ICONS:@ico@${WWWDIR}/${ico}@}

.for htmlr in ${HTMLRULES}
${WWWDIR}/${htmlr:H}:	generate.sh lattuk.css lista.csv
	@./generate.sh ${htmlr:T} > $@
.endfor

.for ico in ${ICONS}
${WWWDIR}/${ico}:	${ico}
	cp ${ico} $@
.endfor
