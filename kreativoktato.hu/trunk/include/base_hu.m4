_2_BODY(_SCRIPT(`menu.sh' m4_ifdef(`CATEGORY',CATEGORY,_FILE) hu))m4_dnl
_2_BODY(<script src="STATIC`/js/cookie_hu.js'"></script>)
m4_define(_H1,`<h1>$* <a href="https://creativedu.hu/'m4_ifdef(`CATEGORY',CATEGORY)/m4_patsubst(_FILE,`public_html/',`')`.html"><img src="STATIC/pict/flag_uk.png" id="flag" alt="English"/></a></h1>')
