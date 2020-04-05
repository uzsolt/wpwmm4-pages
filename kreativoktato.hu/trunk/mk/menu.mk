almenuk!=	echo data/submenu_*
.for l in ${LANG_DIRS}
.for almenu in ${almenuk}
almenupontok!=	awk -F '|' '{print $$3}' ${almenu}
.for almenupont in ${almenupontok}
${l}/${almenupont}_REQ+=	${almenu}
.endfor # almenupont
.endfor # almenu
.endfor
