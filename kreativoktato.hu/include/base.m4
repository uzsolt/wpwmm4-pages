m4_define(`eko_footer',`<div id="footer">:: &#169; Egyesület a Kreatív Oktatásért :: <a href="mailto:info@kreativoktato.hu">info@kreativoktato.hu</a> ::</div>')m4_dnl
m4_define(`LANG',`hu')m4_dnl
_2_HEAD(
  _CHARSET(`utf-8')
  _CSS(`/css/eko.css')
  <link rel='shortcut icon' type="image/ico" href="/pict/favicon.ico"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
)m4_dnl
_2_BODY(_SCRIPT(`menu.sh' m4_ifdef(`CATEGORY',CATEGORY,_FILE)))m4_dnl
