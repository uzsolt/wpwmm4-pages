publikaciocsoportok!=	sed "s,.*|\(.*\),data/publikaciok/\1.csv," data/publikaciok/lista.csv

.for l in ${LANG_DIRS}
${l}/publikaciok.html_REQ+=
	${publikaciocsoportok} \
	scripts/publikaciok.sh \
	data/publikaciok/lista.csv
.endfor
